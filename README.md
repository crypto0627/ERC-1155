# 部屬智能合約ERC-1155 
<div id="top"></div>

ERC-1155介紹
---
<p>
    ERC-1155是一個以太坊區塊鏈上的智能合約標準，ERC-20只能創建交易的Token，ERC-721只能創建唯一Token Id的NFT，而ERC-1155則可以創建ERC-20和ERC-721結合的Token，能夠管理多種代幣，並且可以在同一交易中轉移多個代幣。
</p>

<p>
    舉例來說，遊戲中我們常常會有多個物品或只存在一把的稀有武器，因此使用ERC-1155，遊戲開發人員可以在同一智能合約中管理這些不同類型的物品，並且可以進行批量轉移操作，使得玩家可以更方便地購買、出售和交易。
</p>

<p>
    也可以用於展覽、電影院、劇場和演唱會等NFT門票驗證，開發人員可以使用ERC-1155設計門票能驗證多次、在特定時間使用等功能，但這需要在智能合約設計中添加額外的邏輯，例如檢查NFT門票的有效期、已使用次數等功能。
    設計NFT門票可多次使用的智能合約可能會導致一些問題。例如:NFT門票被非法複製或轉售的風險可能會增加，因為它們可以被多次使用。此外，如果活動或場地限制了入場人數，多次使用NFT門票可能會導致超額入場的問題。
    因此，在設計NFT門票智能合約時，開發人員需要考慮這些風險和限制，以確保活動的安全性和有效性。
</p>

解決的問題
---
ERC-1155解決了ERC-721在大量轉移資產的問題，ERC-721是單個mapping，所以只能一個一個mint，在需要大量轉移時會消耗大量的Gas fee，但ERC-1155使用多重mapping，可以一次大量轉移同一種Token，只需要花費一次mint的Gas fee，因此現在大多用於GameFi遊戲上的Token，

本專案使用的開發工具
---
- [Node.js v18.15.0](https://nodejs.org/en)
- [Hardhat](https://hardhat.org/)
- [Mumbai testnet](https://mumbai.polygonscan.com/)
- [Alchemy Node Provider](https://www.alchemy.com/)
- [Pinata IPFS](https://app.pinata.cloud/)
- [OpenSea testnet](https://testnets.opensea.io/)

建立合約
---
首先我們先創建Hardhat智能合約開發環境
```
$ mkdir web3_contract
$ cd web3_contract
$ npx hardhat
$ npm init -y
$ npm install --save-dev hardhat @nomicfoundation/hardhat-toolbox
```
![](https://i.imgur.com/XYv6jBk.png =250x300)

- 第一部份:撰寫智能合約
使用[Openzeppelin](https://docs.openzeppelin.com/contracts/4.x/wizard)生成ERC-1155合約並複製到contract資料夾內的sol檔

- 第二部份:設定部屬檔案
![](https://i.imgur.com/T0nS4eE.png)

- 第三部份:部屬區塊練網路的設定檔
    ```
    $ npm install --save-dev dotenv
    ```
    下載好dotenv函式庫後，建立.env檔並加入以下內容:![](https://i.imgur.com/YstlvWh.png)
    設定config檔
![](https://i.imgur.com/MwqwgAZ.png)

    1. API_URL為Alchemy mumbai api key
    2. PRIVATE_KEY是錢包的私鑰
    3. POLYSCAN_KEY到下圖申請![](https://i.imgur.com/EVGgQ1E.png)
最後到Pinata上傳NFT圖片並製作Metadata.json，至Pinata上傳圖片成IPFS
![](https://i.imgur.com/ddUh9db.png)
然後，我們依照OpenSea給的Metadata格式將剛剛上傳的IPFS網址貼上![](https://i.imgur.com/6TJvJqy.png)
接著將Metadata.json的IPFS網址貼到合約內如下圖所示![](https://i.imgur.com/QLp8OCC.png)
因為有多個NFT，所以要用{id}導入多個Metadata.json，以上工作完成後即可開始部屬智能合約。

部屬合約
---
執行:
```
$ npx hardhat run scripts/deploy.js --network mumbai
```
會生成合約地址，可以在測試鏈的網站上查看合約內容，如下圖所示。![](https://i.imgur.com/lviAWsa.png)
接著要驗證合約，執行:
```
$ npx hardhat verify --network mumbai <contract_address>
```
即可完成合約部屬。

最終結果
---
1. 點擊連接Web3
![](https://i.imgur.com/Cn5Yv3b.png)
2. Mint NFT
![](https://i.imgur.com/UMUAtc9.png)
3. 交易資訊
![](https://i.imgur.com/c4g5nzO.png)
4. 在OpenSea Testnet查看NFT
![](https://i.imgur.com/964SSXn.png)

ERC-1155一次可以Mint多個Token，並只需要支付一次mint的Gas fee，能在不同於ERC-721上實際應用。

聯絡我
---
[Linkedin](https://www.linkedin.com/in/laihong-kuo-83b186245/)
[Instagram](https://www.instagram.com/klhong_0627)
###### tags: `Smart Contract` `ERC-1155` ` Web3.0`
<a href="#top">Back to top</a>
