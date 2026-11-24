import AppKit
import SwiftUI

// Application entry point.
// This is a Swift Package Manager executable, so we create the NSApplication
// and attach a SwiftUI window manually. Both `swift run` and the bundled .app
// open the same window.
final class AppDelegate: NSObject, NSApplicationDelegate {
    private var window: NSWindow!

    func applicationDidFinishLaunching(_ notification: Notification) {
        let contentView = RootView()
        let hosting = NSHostingView(rootView: contentView)

        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 1220, height: 800),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered,
            defer: false
        )
        window.title = "Decision Trainer"
        window.center()
        window.minSize = NSSize(width: 980, height: 660)
        window.contentView = hosting
        window.setFrameAutosaveName("DecisionTrainer.MainWindow")
        self.window = window

        window.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        true
    }
}

let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate
app.setActivationPolicy(.regular)
app.run()
