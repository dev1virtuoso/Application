import markdown
import json
from bs4 import BeautifulSoup
import os
import glob
import re

def parse_markdown_to_json(input_dir, output_json_path):
    try:
        import markdown
        import bs4
    except ImportError:
        print("Required packages 'markdown' and 'beautifulsoup4' are not installed.")
        print("Run: pip install markdown beautifulsoup4")
        return

    if not os.path.exists(input_dir):
        print(f"Input directory '{input_dir}' does not exist.")
        return

    md_files = glob.glob(os.path.join(input_dir, "*.md"))
    if not md_files:
        print(f"No Markdown files found in '{input_dir}'.")
        return

    valid_langs = ['en', 'zh', 'kr']
    print("Please specify the language for all Markdown files (en, zh, or kr):")
    lang = input().strip().lower()
    if lang not in valid_langs:
        print(f"Invalid language code. Must be one of {valid_langs}. Exiting.")
        return

    entries = []

    for md_file in md_files:
        print(f"Processing file: {md_file}")
        try:
            with open(md_file, 'r', encoding='utf-8') as f:
                md_content = f.read()
        except Exception as e:
            print(f"Error reading '{md_file}': {e}")
            continue

        content_text = md_content.replace('<br>', '\n').replace('<br/>', '\n').replace('<br />', '\n')

        html = markdown.markdown(content_text, extensions=['nl2br'])

        soup = BeautifulSoup(html, 'html.parser')

        def convert_to_markdown_text(element):
            result = []
            for child in element.children:
                if child.name == 'a':
                    text = child.get_text().strip()
                    href = child.get('href', '')
                    if text and href:
                        result.append(f"[{text}]({href})")
                elif child.name:
                    result.append(convert_to_markdown_text(child))
                else:
                    text = str(child).strip()
                    if text:
                        result.append(text)
            return ' '.join(result).replace('\n ', '\n').strip()

        content_text = convert_to_markdown_text(soup)

        entry = {
            "date": "",
            "url": "",
            "title": {
                "en": "",
                "zh": "",
                "kr": ""
            },
            "content": {
                "en": "" if lang != 'en' else content_text,
                "zh": "" if lang != 'zh' else content_text,
                "kr": "" if lang != 'kr' else content_text
            }
        }
        entries.append(entry)

    if not entries:
        print("No valid entries were created. Exiting.")
        return

    try:
        with open(output_json_path, 'w', encoding='utf-8') as f:
            json.dump(entries, f, ensure_ascii=False, indent=2)
        print(f"\nJSON file saved to '{output_json_path}'")
    except Exception as e:
        print(f"Error writing JSON file: {e}")

def main():
    input_dir = 'input_md'
    json_file = 'blogs.json'

    parse_markdown_to_json(input_dir, json_file)

if __name__ == '__main__':
    main()
