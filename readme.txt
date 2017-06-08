This is a ruby script that will take a google sheet and extract erc20 tokens for use with myetherwallet.

general usage: ./run.rb key
usage with MyEtherWallet: ./run.rb key > /var/www/etherwallet/app/scripts/tokens/ethTokens.json

To get the key, open the google sheet and click File > Publish to the Web...
key is in the url they give you, https://docs.google.com/spreadsheets/d/[KEY]/pubhtml
