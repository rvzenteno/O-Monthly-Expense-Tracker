# Setting Up Donation/Support Links

This guide will help you configure all the donation and support links in your Monthly Expense Tracker plugin.

## 🎯 Overview

The plugin has donation/support links in **4 locations**:
1. **GitHub Funding Button** - Appears on your GitHub repo
2. **SUPPORT.md** - Comprehensive donation page
3. **Plugin Settings** - Support section in Obsidian settings
4. **Dashboard** - "💙 Support Plugin" button
5. **README.md** - Support section

## 📝 Step-by-Step Setup

### Step 1: Set Up Payment Methods

Before updating the plugin, set up your payment accounts:

#### PayPal
1. Go to https://www.paypal.me
2. Create your PayPal.me link (e.g., `paypal.me/yourusername`)
3. Note your username

#### Cryptocurrency Wallets

**For USDC:**
- Get an Ethereum wallet address (MetaMask, Coinbase Wallet, etc.)
- Same address works on: Ethereum, Polygon, Arbitrum, Optimism
- Format: `0x1234...` (42 characters)

**For USDT:**
- Ethereum (ERC-20): Same as your ETH address (`0x1234...`)
- Tron (TRC-20): Need a Tron wallet (`T1234...`)
- Note: TRC-20 has lower fees!

**Easy Option - Coinbase Commerce:**
1. Go to https://commerce.coinbase.com
2. Sign up for free account
3. Create a "Checkout" button
4. Get your checkout URL: `commerce.coinbase.com/checkout/YOUR-ID`
5. This accepts 100+ cryptocurrencies automatically!

#### Buy Me a Coffee (Optional)
1. Go to https://www.buymeacoffee.com
2. Sign up with your username
3. Get your link: `buymeacoffee.com/yourusername`

#### Ko-fi (Optional)
1. Go to https://ko-fi.com
2. Sign up with your username
3. Get your link: `ko-fi.com/yourusername`

---

### Step 2: Update GitHub Funding File

Edit `.github/FUNDING.yml`:

```yaml
# Replace these with your actual links
custom: ['https://www.paypal.me/YOUR-PAYPAL-USERNAME', 'https://commerce.coinbase.com/checkout/YOUR-CHECKOUT-ID']
```

**Example:**
```yaml
custom: ['https://www.paypal.me/victorchargengo', 'https://commerce.coinbase.com/checkout/abc123xyz']
```

---

### Step 3: Update SUPPORT.md

Edit `SUPPORT.md` and replace all placeholder URLs and addresses:

**Find and Replace:**
```
https://www.paypal.me/yourusername
→ https://www.paypal.me/YOUR-ACTUAL-USERNAME

0xYourEthereumAddressHere
→ 0xYourActualEthereumAddress

TYourTronAddressHere
→ TYourActualTronAddress

https://commerce.coinbase.com/checkout/your-checkout-id
→ https://commerce.coinbase.com/checkout/YOUR-ACTUAL-CHECKOUT-ID

https://www.buymeacoffee.com/yourusername
→ https://www.buymeacoffee.com/YOUR-ACTUAL-USERNAME

https://ko-fi.com/yourusername
→ https://ko-fi.com/YOUR-ACTUAL-USERNAME

your.email@example.com
→ your-actual-email@domain.com

@yourusername (Twitter)
→ @YourActualTwitterHandle
```

**Example Ethereum Address:**
```
Before: 0xYourEthereumAddressHere
After:  0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb1
```

**Example Tron Address:**
```
Before: TYourTronAddressHere
After:  TJwS2MxK2tQfqiPcYW5JvZh2CYhbEGjgYX
```

---

### Step 4: Update Plugin Code (main.ts)

Edit `main.ts` and replace URLs in **3 places**:

#### Location 1: Settings Tab Support Section

Find this section (around line 1050):
```typescript
// PayPal button
const paypalBtn = supportLinks.createEl('a', { 
    text: '💳 PayPal',
    href: 'https://www.paypal.me/yourusername'  // ← CHANGE THIS
});
```

Replace all instances:
- `https://www.paypal.me/yourusername`
- `https://github.com/yourusername/monthly-expense-tracker/blob/main/SUPPORT.md`
- `https://commerce.coinbase.com/checkout/your-checkout-id`
- `https://www.buymeacoffee.com/yourusername`

#### Location 2: SupportModal Class

Find the `SupportModal` class (around line 700):
```typescript
const paypalBtn = paypalSection.createEl('a', { 
    text: '→ Donate via PayPal',
    href: 'https://www.paypal.me/yourusername'  // ← CHANGE THIS
});
```

Replace all crypto addresses and URLs:
```typescript
usdcDiv.createEl('code', { text: '0xYourEthereumAddressHere' });
// Change to your actual address:
usdcDiv.createEl('code', { text: '0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb1' });
```

Do the same for:
- USDT addresses
- GitHub link
- Coinbase Commerce link
- Buy Me a Coffee link

---

### Step 5: Update README.md

Edit `README.md` and find the Support section:

```markdown
### 💰 Donate
- **PayPal:** [paypal.me/yourusername](https://www.paypal.me/yourusername)
```

Replace all URLs with your actual links.

---

### Step 6: Test Everything

After making changes:

1. **Rebuild the plugin:**
   ```bash
   npm run build
   ```

2. **Test in Obsidian:**
   - Open Settings → Monthly Expense Tracker
   - Verify support links work
   - Open Dashboard → Click "💙 Support Plugin"
   - Verify modal shows correct addresses

3. **Test on GitHub:**
   - Push to GitHub
   - Check if "Sponsor" button appears
   - Verify links work

---

## 🔍 Quick Find & Replace Guide

Use your text editor's find & replace feature:

### URLs to Replace
```
Find: https://www.paypal.me/yourusername
Replace: https://www.paypal.me/YOUR-USERNAME

Find: https://commerce.coinbase.com/checkout/your-checkout-id
Replace: https://commerce.coinbase.com/checkout/YOUR-CHECKOUT-ID

Find: https://www.buymeacoffee.com/yourusername
Replace: https://www.buymeacoffee.com/YOUR-USERNAME

Find: https://ko-fi.com/yourusername
Replace: https://ko-fi.com/YOUR-USERNAME

Find: https://github.com/yourusername/monthly-expense-tracker
Replace: https://github.com/YOUR-GITHUB-USERNAME/monthly-expense-tracker
```

### Addresses to Replace
```
Find: 0xYourEthereumAddressHere
Replace: 0xYOUR-ACTUAL-ADDRESS

Find: TYourTronAddressHere
Replace: TYOUR-ACTUAL-TRON-ADDRESS
```

### Contact Info to Replace
```
Find: your.email@example.com
Replace: your-actual@email.com

Find: @yourusername
Replace: @YourActualHandle
```

---

## 📋 Files to Update Checklist

- [ ] `.github/FUNDING.yml`
- [ ] `SUPPORT.md` (all URLs and addresses)
- [ ] `main.ts` (Settings tab section)
- [ ] `main.ts` (SupportModal class)
- [ ] `README.md` (Support section)
- [ ] Test PayPal link
- [ ] Test crypto addresses (send small test amount)
- [ ] Test Coinbase Commerce checkout
- [ ] Test all buttons in plugin

---

## 🎨 Customization Tips

### Change Button Text
In `main.ts`, find:
```typescript
const supportBtn = actions.createEl('button', { text: '💙 Support Plugin' });
```
Change to:
```typescript
const supportBtn = actions.createEl('button', { text: '☕ Buy Me Coffee' });
```

### Add More Payment Methods

Add a new section in `SupportModal`:
```typescript
// Venmo Section (example)
const venmoSection = contentEl.createDiv('support-section');
venmoSection.createEl('h3', { text: '💚 Venmo' });
venmoSection.createEl('p', { text: 'Send via Venmo:' });
const venmoBtn = venmoSection.createEl('a', { 
    text: '→ @YourVenmoUsername',
    href: 'https://venmo.com/YourVenmoUsername'
});
venmoBtn.addClass('support-link');
```

### Hide Support Section

If you want to make it free without donation options:

1. In `main.ts`, comment out the support button:
```typescript
// const supportBtn = actions.createEl('button', { text: '💙 Support Plugin' });
// supportBtn.onclick = () => { new SupportModal(this.app).open(); };
```

2. Comment out the support section in settings tab

---

## 🔐 Security Tips

### Cryptocurrency Addresses
- **Always triple-check addresses** - wrong address = lost funds
- Test with a small amount first
- Use a hardware wallet for better security
- Consider using multi-sig for large amounts

### PayPal
- Enable 2FA on your PayPal account
- Monitor transactions regularly
- Set up email notifications

### Privacy
- Consider using a separate email for donations
- You can accept anonymous donations
- Don't share private keys anywhere in the code

---

## 📊 Tracking Donations

### PayPal
- Built-in dashboard shows all donations
- Export transaction history
- Set up email notifications

### Cryptocurrency
- Use blockchain explorers:
  - Ethereum/USDC: etherscan.io
  - Tron/USDT: tronscan.org
  - Polygon: polygonscan.com
- Set up wallet notifications
- Consider using a dedicated donation wallet

### Coinbase Commerce
- Full dashboard with analytics
- Email notifications
- Automatic conversion to your preferred currency

---

## 💡 Marketing Your Support Options

### In Plugin
- ✅ Support button in dashboard (already done)
- ✅ Support section in settings (already done)
- Consider: Notification after X days of use

### On GitHub
- ✅ FUNDING.yml for Sponsor button
- ✅ SUPPORT.md with all options
- Add donation badges to README

### Social Media
Share your donation links:
- Twitter/X announcements
- Reddit posts
- Obsidian community forum
- Discord servers

---

## ❓ FAQ

**Q: Do I need all payment methods?**
A: No! Start with just PayPal or crypto. Add more later.

**Q: Which crypto is easiest for donors?**
A: Coinbase Commerce - accepts 100+ coins, easy checkout.

**Q: What about fees?**
A: PayPal ~3%, Crypto varies (ETH high, Tron/Polygon low), Coinbase Commerce 1%

**Q: Can I use personal addresses?**
A: Yes, but consider a separate business/project address for organization.

**Q: How do I thank donors?**
A: Add their name (with permission) to SUPPORT.md supporters list.

---

## 🚀 You're All Set!

Once you've updated all the links and addresses:
1. Rebuild the plugin
2. Test everything
3. Push to GitHub
4. Start accepting support!

**Good luck with your plugin! 💙**

---

## 📧 Questions?

If you need help setting up donations, feel free to reach out or check the examples in the files.
