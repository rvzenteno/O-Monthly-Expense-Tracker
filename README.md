# Monthly Expense Tracker for Obsidian

A comprehensive Obsidian plugin for tracking recurring monthly expenses, managing payments, and generating financial reports. Perfect for keeping track of bills, subscriptions, and regular payments.

## Features

### 🎯 Core Functionality
- **Recurring Expense Management**: Define expenses that repeat monthly with name, amount, due date, and payment method
- **Payment Tracking**: Mark expenses as paid/unpaid with optional confirmation numbers
- **Automatic Monthly Notes**: Auto-generate monthly expense tracking notes
- **Smart Carryover**: Unpaid expenses automatically carry over to the next month
- **Expense Lifecycle**: Set start/end dates for expenses or archive when no longer needed

### 📊 Dashboard & Visualization
- **Interactive Dashboard**: Sidebar view with month navigation
- **Visual Indicators**: Color-coded status for paid, unpaid, and overdue expenses
- **Summary Statistics**: Quick overview of total expenses, unpaid count, and payment amounts
- **Status Bar**: Real-time unpaid expense count in Obsidian's status bar

### 📝 Reporting & History
- **Payment History**: View complete payment history for any expense
- **Custom Reports**: Generate expense reports for any date range
- **Monthly Summaries**: Automatic breakdown by month with payment statistics
- **Archive Management**: Keep discontinued expenses archived for historical reference

### 🎨 User Interface
- **Calendar Navigation**: Jump to any month instantly
- **Command Palette**: Quick access to all features via Obsidian commands
- **Context Menus**: Right-click for edit, archive, delete options
- **Responsive Design**: Works seamlessly on desktop and mobile

## Installation

### Method 1: Manual Installation (Recommended)

1. Download the plugin files:
   - `main.js`
   - `manifest.json`
   - `styles.css`

2. Create plugin folder:
   ```
   [Your Vault]/.obsidian/plugins/monthly-expense-tracker/
   ```

3. Copy the downloaded files into this folder

4. Reload Obsidian

5. Go to Settings → Community Plugins → Enable "Monthly Expense Tracker"

### Method 2: Build from Source

1. Clone this repository into your vault's plugins folder:
   ```bash
   cd [Your Vault]/.obsidian/plugins/
   git clone https://github.com/yourusername/monthly-expense-tracker.git
   cd monthly-expense-tracker
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Build the plugin:
   ```bash
   npm run build
   ```

4. Reload Obsidian and enable the plugin

### Method 3: Development Mode

For plugin development:
```bash
npm run dev
```
This will watch for changes and rebuild automatically.

## Quick Start Guide

### Step 1: Add Your First Expense

1. Click the wallet icon in the left ribbon, or use Command Palette: "Add Recurring Expense"
2. Fill in the expense details:
   - **Name**: e.g., "Electric Bill"
   - **Amount**: e.g., 125.50
   - **Due Day**: Day of month (1-31)
   - **Payment Method**: e.g., "Auto-pay", "Credit Card", "Bank Transfer"
   - **Start Month**: When this expense begins (YYYY-MM format)
   - **End Month** (optional): When this expense ends
   - **Category** (optional): Group expenses by category

3. Click "Save"

### Step 2: Open the Dashboard

- Click the wallet icon in the ribbon, or
- Use Command Palette: "Open Expense Dashboard"

The dashboard shows:
- Current month's expenses
- Payment status (paid/unpaid)
- Summary statistics
- Quick action buttons

### Step 3: Mark Expenses as Paid

1. In the dashboard, click the checkbox next to an expense
2. Optionally add a confirmation number
3. Click "Mark Paid"

The expense will be marked with ✅ and moved to the "Paid" section.

### Step 4: Create Monthly Notes

Monthly notes are created automatically when a new month begins (if enabled in settings). You can also create them manually:

- Use Command Palette: "Create Current Month Note"
- Or click "📄 Create Monthly Note" in the dashboard

Monthly notes include:
- All expenses for that month
- Checkboxes for tracking payment status
- Unpaid expenses from previous month (if any)
- Expense IDs for reference

## Usage Examples

### Tracking Regular Bills

```
Electric Bill - $125.50 - Due: 15th
Internet - $79.99 - Due: 1st
Water Bill - $45.00 - Due: 20th
```

### Managing Subscriptions

```
Netflix - $15.99 - Due: 5th - Credit Card
Spotify - $9.99 - Due: 12th - Credit Card
Amazon Prime - $14.99 - Due: 1st - Auto-pay
```

### Time-Limited Expenses

Set an end date for expenses that don't continue indefinitely:
```
Gym Membership (6-month contract)
Start: 2025-01
End: 2025-06
```

## Dashboard Navigation

### Month Selector
- **◀ / ▶**: Navigate previous/next month
- **Today**: Jump to current month

### Expense Actions
Each expense has a menu (⋮) with options:
- **Edit**: Modify expense details
- **View History**: See complete payment history
- **Archive**: Hide from active expenses (keeps history)
- **Delete**: Permanently remove expense and all payment records

### Quick Actions
- **+ Add Expense**: Create new recurring expense
- **📄 Create Monthly Note**: Generate note for current month
- **📊 Generate Report**: Create custom date range report

## Generating Reports

1. Click "📊 Generate Report" in the dashboard
2. Select date range:
   - Start Month (YYYY-MM)
   - End Month (YYYY-MM)
3. Click "Generate"

Reports include:
- Monthly breakdown with totals
- Payment rate percentages
- Per-expense analysis
- Total amounts paid/unpaid

Reports are saved as markdown files in your vault.

## Command Palette Commands

Access these via `Ctrl/Cmd + P`:

- **Open Expense Dashboard**: Open the main dashboard view
- **Add Recurring Expense**: Create a new expense
- **Create Current Month Note**: Generate this month's tracking note
- **Generate Expense Report**: Create a custom report

## Settings

Access settings via Settings → Plugin Options → Monthly Expense Tracker

### Available Settings

**Monthly Notes Folder**
- Default: `Monthly Expenses`
- Folder where monthly tracking notes are created

**Auto-create Monthly Notes**
- Default: Enabled
- Automatically creates notes when a new month begins

**Show Status Bar**
- Default: Enabled
- Displays unpaid count in Obsidian's status bar

**Monthly Note Template**
- Customize the format of monthly notes
- Available placeholders:
  - `{{month}}`: Formatted month name (e.g., "January 2025")
  - `{{expenses}}`: Generated expense list

## Data Storage

The plugin uses a hybrid storage approach:

### Master Data (JSON)
Stored in `.obsidian/plugins/monthly-expense-tracker/data.json`:
- Recurring expense definitions
- Payment records
- Plugin settings

### Monthly Notes (Markdown)
Stored in your vault:
- Human-readable expense lists
- Payment checkboxes
- Monthly summaries

Both are synced automatically - changes in the dashboard update the JSON, and the plugin can regenerate monthly notes from the master data.

## Tips & Best Practices

### 🎯 Organizing Expenses

**Use Categories**: Group expenses for better organization
```
Category: Housing → Rent, Electric, Water
Category: Entertainment → Netflix, Spotify, Gaming
Category: Insurance → Health, Car, Life
```

**Payment Methods**: Be consistent with naming
```
✅ "Credit Card - Visa"
✅ "Auto-pay"
✅ "Bank Transfer"
❌ "CC", "visa", "my visa card" (inconsistent)
```

### 📅 Managing Due Dates

- Set due dates to align with your pay schedule
- Use the first business day for auto-pay items
- Add buffer days for manual payments

### 🔔 Staying on Top of Payments

1. Check the dashboard weekly
2. Use the status bar as a quick reminder
3. Create monthly notes at the start of each month
4. Review unpaid carryovers promptly

### 📊 Financial Planning

- Generate quarterly reports to track spending trends
- Compare year-over-year expenses
- Use categories to identify cost-cutting opportunities
- Archive discontinued expenses but keep history

### 🗂️ Archive vs Delete

**Archive** when you want to:
- Keep payment history
- Temporarily pause tracking
- Reference discontinued expenses

**Delete** when you want to:
- Permanently remove incorrect entries
- Clean up test expenses
- Remove all associated data

## Keyboard Shortcuts

While there are no default keyboard shortcuts, you can set custom hotkeys for any command:

1. Go to Settings → Hotkeys
2. Search for "Monthly Expense Tracker"
3. Assign shortcuts to your preferred commands

Suggested shortcuts:
- `Ctrl + Shift + E`: Open Expense Dashboard
- `Ctrl + Shift + A`: Add Recurring Expense

## Troubleshooting

### Expenses Not Showing in Dashboard

**Cause**: Expense start date is in the future or end date is in the past
**Solution**: Check the start/end dates in the expense editor

### Monthly Note Not Auto-Created

**Cause**: Auto-creation disabled in settings
**Solution**: Enable "Auto-create Monthly Notes" in settings or create manually

### Payment Status Not Syncing

**Cause**: Using custom note format without expense IDs
**Solution**: Recreate monthly notes using the dashboard

### Status Bar Not Updating

**Cause**: Status bar disabled in settings
**Solution**: Enable "Show Status Bar" and restart Obsidian

## Frequently Asked Questions

**Q: Can I track expenses that aren't monthly?**
A: This plugin is designed for monthly recurring expenses. For one-time or irregular expenses, consider using Obsidian's daily notes or a separate tracking system.

**Q: What happens to unpaid expenses?**
A: Unpaid expenses automatically appear in the next month's note in a separate "Unpaid from Previous Month" section.

**Q: Can I edit payment amounts month-to-month?**
A: The recurring expense amount is fixed. If an amount varies, you can add notes in the monthly note or create separate expense entries.

**Q: How do I backup my data?**
A: Your data is stored in `data.json` within the plugin folder. Back it up with your vault, or export reports for external records.

**Q: Can multiple people use this in a shared vault?**
A: Yes, but note that payment tracking is per-vault, not per-user. Consider separate vaults for individual expense tracking.

**Q: Does this work on mobile?**
A: Yes! The plugin is fully responsive and works on Obsidian mobile apps.

## Roadmap

Potential future features:
- [ ] Budget targets and warnings
- [ ] Recurring income tracking
- [ ] Category-based analytics
- [ ] Export to CSV/Excel
- [ ] Recurring expense templates
- [ ] Split expenses (shared costs)
- [ ] Multi-currency support
- [ ] Payment reminders/notifications
- [ ] Integration with bank statements

## Contributing

Contributions are welcome! Please feel free to submit pull requests or create issues for bugs and feature requests.

### Development Setup

1. Fork the repository
2. Clone to your vault's plugins folder
3. Run `npm install`
4. Make changes
5. Test thoroughly
6. Submit pull request

### Code Structure

```
main.ts          - Core plugin logic, views, and modals
styles.css       - All styling and theme support
manifest.json    - Plugin metadata
```

## Support

If you find this plugin helpful, consider supporting its development:

### 💰 Donate
- **PayPal:** [paypal.com/paypalme/VictorZenteno](https://www.paypal.com/paypalme/VictorZenteno)
- **USDC:** `0x1023142d0548b63542f2a4803b6724d4c26b8bda` (Base Network - Low Fees)
- **USDT:** `TAV7qTGgvn8GnYJfXfes73tD2dAPQJ3L2W` (Tron TRC-20 - Ultra Low Fees)
- **Buy Me a Coffee:** [buymeacoffee.com/rvzen](https://buymeacoffee.com/rvzen)

### 🌟 Other Ways to Support
- ⭐ Star the repository
- 🐛 Report bugs and issues
- 💡 Suggest features
- 📝 Improve documentation
- 🗣️ Tell others about the plugin
- ✍️ Write a review

[**See all support options →**](SUPPORT.md)

## License

MIT License - feel free to use, modify, and distribute as needed.

## Changelog

### Version 1.0.0 (Initial Release)
- ✅ Recurring expense management
- ✅ Payment tracking with confirmation numbers
- ✅ Interactive dashboard with month navigation
- ✅ Automatic monthly note generation
- ✅ Unpaid expense carryover
- ✅ Payment history viewer
- ✅ Custom date range reports
- ✅ Archive functionality
- ✅ Status bar integration
- ✅ Fully responsive design
- ✅ Dark/light theme support

## Credits

Created by Victor for the Obsidian community.

Built with:
- [Obsidian API](https://github.com/obsidianmd/obsidian-api)
- TypeScript
- esbuild

---

**Happy expense tracking! 💰📊**
