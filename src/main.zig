const std = @import("std");
const WebView = @import("webview").WebView;

const JS = @embedFile("client-bundle");

pub fn main() !void {
    const w = WebView.create(false, null);
    defer w.destroy();
    w.setTitle("Calling Javascript");
    w.setSize(480, 320, WebView.WindowSizeHint.None);
    w.eval(JS);
    w.run();
}
