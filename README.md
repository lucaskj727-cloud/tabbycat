# DebateFlow

<div align="center">

![DebateFlow Logo](tabbycat/static/logo.svg)

**Advanced tournament tabulation system for parliamentary debate**

[![License](https://img.shields.io/badge/license-AGPL--3.0-blue.svg)](LICENSE.md)
[![Repository](https://img.shields.io/badge/repo-lucaskj727--cloud%2Ftabbycat-blue)](https://github.com/lucaskj727-cloud/tabbycat)

### 🚀 [**Deploy Now & Use Immediately**](DEPLOY_NOW.md) 🚀

</div>

---

## 🎯 What is DebateFlow?

DebateFlow is a comprehensive debate tournament management system that handles everything from team registration to final standings. It supports British Parliamentary (BP) and two-team parliamentary formats, making it perfect for tournaments of any size.

**Used by tournaments worldwide** including Australs, EUDC, WUDC, and hundreds of local competitions.

## ✨ Key Features

- 📊 **Complete Tournament Management** - Handle registrations, draws, results, and standings
- 🎲 **Automated Draw Generation** - Support for power-paired, random, and custom draw algorithms
- 👥 **Adjudicator Allocation** - Smart allocation based on conflicts, experience, and preferences
- 📱 **Multi-Device Support** - Works on desktop, tablet, and mobile devices
- 🌐 **Online & Offline** - Run entirely online or use offline with printed ballots
- 📈 **Real-time Results** - Live standings and speaker rankings
- 🔒 **Flexible Privacy** - Control what information is public vs. private
- 📋 **Feedback System** - Collect and manage adjudicator feedback
- 🎨 **Customizable** - Configure rules, formats, and display options

## 🚀 Quick Start

### ⚡ Want to Use It Right Now?

**See [DEPLOY_NOW.md](DEPLOY_NOW.md) for instant cloud deployment** (Free, 10 minutes)

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

### Option 1: Cloud Deployment (Recommended for Online Tournaments)

The easiest way to get started is deploying to a cloud platform:

**Heroku (Paid)**
```bash
# Use the Heroku button or:
git clone https://github.com/lucaskj727-cloud/tabbycat
cd tabbycat
# Follow instructions at: docs/install/heroku.html
```

**Render (Free Tier Available)**
```bash
# Use the render.yaml configuration
# See: docs/install/render.html
```

### Option 2: Local Installation (For Offline Tournaments)

Install and run on your own computer:

#### Prerequisites
- Python 3.11 or 3.12
- Node.js 16 or higher
- PostgreSQL (optional, SQLite works for small tournaments)

#### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/lucaskj727-cloud/tabbycat
   cd tabbycat
   ```

2. **Install Python dependencies**
   ```bash
   pip install pipenv
   pipenv install
   pipenv shell
   ```

3. **Install Node dependencies and build assets**
   ```bash
   npm install
   npm run build
   ```

4. **Initialize the database**
   ```bash
   python manage.py migrate
   ```

5. **Create a superuser account**
   ```bash
   python manage.py createsuperuser
   ```

6. **Run the development server**
   ```bash
   python manage.py runserver
   ```

7. **Access DebateFlow**
   Open your browser to: `http://localhost:8000`

## 📖 How to Use DebateFlow

### First Time Setup

1. **Access the Admin Interface**
   - Navigate to `http://localhost:8000` (or your deployed URL)
   - Log in with your superuser credentials

2. **Create a Tournament**
   - Click "Create Tournament" or "Start"
   - Enter tournament name, slug (URL identifier), and settings
   - Choose your debate format (BP, Australs, etc.)

3. **Import Data**
   - Go to **Setup → Import Data**
   - Upload CSV files with:
     - Teams (institution, team name, speakers)
     - Adjudicators (name, institution, rating)
     - Venues (name, categories)
   - Or enter data manually through the interface

4. **Configure Tournament Settings**
   - **Setup → Configuration** to adjust:
     - Draw rules (power-paired, random, etc.)
     - Scoring system
     - Break categories
     - Public information display

### Running a Round

1. **Generate the Draw**
   - Navigate to **Draw → Generate Draw**
   - Review and make manual adjustments if needed
   - Click **Release Draw** to make it public

2. **Allocate Adjudicators**
   - Go to **Adjudicators → Allocate Adjudicators**
   - Use automatic allocation or drag-and-drop interface
   - Review conflicts and panel strength
   - Save and release allocations

3. **Assign Venues**
   - **Venues → Assign Venues**
   - Auto-assign or manually assign rooms
   - Consider venue constraints and preferences

4. **Collect Ballots**
   - **Results → Enter Results**
   - Options:
     - **Online entry**: Adjudicators/tabroom enter via web
     - **Printed ballots**: Print custom scoresheets
   - Enter speaker scores and result

5. **Check and Release Results**
   - Review all ballots for completeness
   - Confirm results are correct
   - Release to make standings public

### Common Workflows

#### Setting Up Breaks
1. **Setup → Configuration → Break Categories**
2. Define break size and eligibility rules
3. After preliminary rounds: **Breaks → Generate Break**
4. Review and adjust as needed

#### Managing Feedback
1. **Setup → Configuration → Feedback**
2. Configure feedback questions
3. Adjudicators submit via **Enter Feedback**
4. View aggregated feedback per adjudicator

#### Checking In Participants
1. **Availability → Check-Ins**
2. Enable check-in for round
3. Teams/adjudicators check in via web or barcode scan
4. Use to track attendance and availability

## 📚 Full Documentation

For detailed guides, visit the comprehensive documentation:

- 📘 **[Installation Guides](docs/install/)** - Platform-specific setup
- 📗 **[User Guide](docs/use/)** - Day-to-day tournament operations
- 📙 **[Features](docs/features/)** - In-depth feature documentation
- 📕 **[Tournament Guide](docs/guide/)** - Best practices and logistics

Or see the [GETTING_STARTED.md](GETTING_STARTED.md) guide for a detailed walkthrough.

## 🎓 Video Tutorials

Coming soon! Check back for video walkthroughs of:
- Setting up your first tournament
- Running a round from start to finish
- Advanced features and customization

## 🔧 Configuration

### Database Options

**SQLite (Default)** - Good for small tournaments (< 100 teams)
```python
# Default configuration, no setup needed
```

**PostgreSQL (Recommended)** - Better for larger tournaments
```python
# Set environment variables:
DATABASE_URL=postgresql://user:password@localhost/debateflow
```

### Environment Variables

Key environment variables for deployment:

```bash
# Security
SECRET_KEY=your-secret-key-here
DEBUG=False

# Database
DATABASE_URL=postgresql://...

# Email (for notifications)
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_HOST_USER=your-email@example.com
EMAIL_HOST_PASSWORD=your-password

# Public URL
ALLOWED_HOSTS=yourdomain.com
```

## 🛟 Support & Help

### Getting Help

- 📖 **Documentation**: Check [docs/](docs/) for detailed guides
- 💬 **Issues**: Report bugs on [GitHub Issues](https://github.com/lucaskj727-cloud/tabbycat/issues)
- 📧 **Email**: Contact the maintainer

### Common Issues

**Problem: CSS not loading**
```bash
# Rebuild static assets
npm run build
python manage.py collectstatic
```

**Problem: Database errors**
```bash
# Reset and migrate
python manage.py migrate --run-syncdb
```

**Problem: Import errors**
```bash
# Check CSV format matches examples in data/demo/
# Ensure UTF-8 encoding
```

## 🤝 Contributing

Contributions welcome! This is a white-labeled fork of Tabbycat.

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📄 License

DebateFlow is licensed under the [GNU Affero General Public License v3.0](LICENSE.md).

**Key points:**
- ✅ Free to use and modify
- ✅ Source code must remain open
- ✅ Modifications must be shared publicly
- ✅ Network use requires source disclosure

## 🙏 Credits

Based on [Tabbycat](https://github.com/TabbycatDebate/tabbycat) by:
- Qi-Shan Lim (original author)
- Philip Belesky
- Chuan-Zheng Lee
- Étienne Beaulé

Rebranded as DebateFlow with custom visual identity.

## 🔗 Links

- **Repository**: https://github.com/lucaskj727-cloud/tabbycat
- **Original Tabbycat**: https://github.com/TabbycatDebate/tabbycat
- **Tabbycat Documentation**: https://tabbycat.readthedocs.io

---

<div align="center">

**Ready to run your debate tournament? Get started now!** 🎤💙

[Download](https://github.com/lucaskj727-cloud/tabbycat/archive/refs/heads/main.zip) | [Documentation](docs/) | [Report Issue](https://github.com/lucaskj727-cloud/tabbycat/issues)

</div>
