# js_swift_callback
javascript → swiftのコールバックをするサンプル

# javascript

swiftを呼び出すjavascriptでは以下のように記載する

```
<script>
    function exec() {
        window.webkit.messageHandlers.example.postMessage("[message]");
    }
</script>
```

# WKWebViewを使う時の注意点

デフォルトではHTTPS通信のみ可能となっている  
HTTP通信をしたい場合はinfo.plistに以下の定義を追加する

```
<key>NSAppTransportSecurity</key>
	<dict>
		<key>NSAllowsArbitraryLoads</key>
		<false/>
		<key>NSAllowsArbitraryLoadsInWebContent</key>
		<true/>
  </dict>
```
