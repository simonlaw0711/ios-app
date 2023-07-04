import UIKit
import WebKit

class TelegramAuthViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView(frame: .zero)
        webView.navigationDelegate = self
        let url = URL(string: "https://yourserver.com/telegram_login")!
        let request = URLRequest(url: url)
        webView.load(request)
        self.view.addSubview(webView)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let url = navigationAction.request.url else {
            decisionHandler(.allow)
            return
        }
        
        if url.scheme == "myapp" {
            handleTelegramAuthorization(url: url)
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
        }
    }
    
    func handleTelegramAuthorization(url: URL) {
        // Extract the authorization data from the URL and handle it.
        // ...
        
        // Dismiss the WebView.
        webView.removeFromSuperview()
        webView = nil
    }
}
