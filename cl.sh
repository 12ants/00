
#!/bin/bash


read -ep "  --  Project-name:? " aa
CLOUDFLARE_ACCOUNT_ID=dd8ed57450eda131bce367222b8a1a71 npx wrangler pages publish ./ --project-name=$aa
