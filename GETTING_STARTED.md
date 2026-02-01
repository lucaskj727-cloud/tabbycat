# Getting Started with DebateFlow

Welcome! This guide will walk you through setting up and running your first debate tournament with DebateFlow.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Installation](#installation)
3. [Creating Your First Tournament](#creating-your-first-tournament)
4. [Importing Participants](#importing-participants)
5. [Running Your First Round](#running-your-first-round)
6. [Complete Tournament Workflow](#complete-tournament-workflow)
7. [Tips and Best Practices](#tips-and-best-practices)
8. [Troubleshooting](#troubleshooting)

---

## Prerequisites

### For Local Installation

You'll need to install:

1. **Python 3.11 or 3.12**
   - Download from [python.org](https://www.python.org/downloads/)
   - Verify: `python --version`

2. **Node.js 16 or higher**
   - Download from [nodejs.org](https://nodejs.org/)
   - Verify: `node --version`

3. **Git** (to clone the repository)
   - Download from [git-scm.com](https://git-scm.com/)
   - Verify: `git --version`

4. **PostgreSQL** (optional, recommended for larger tournaments)
   - Download from [postgresql.org](https://www.postgresql.org/download/)
   - SQLite works fine for tournaments with < 100 teams

### For Cloud Deployment

- A Heroku, Render, or similar cloud platform account
- Basic familiarity with deploying web applications

---

## Installation

### Step 1: Get the Code

```bash
# Clone the repository
git clone https://github.com/lucaskj727-cloud/tabbycat
cd tabbycat
```

### Step 2: Set Up Python Environment

```bash
# Install pipenv (if you don't have it)
pip install pipenv

# Install Python dependencies
pipenv install

# Activate the virtual environment
pipenv shell
```

### Step 3: Build Frontend Assets

```bash
# Install Node dependencies
npm install

# Build CSS and JavaScript
npm run build
```

### Step 4: Initialize Database

```bash
# Run migrations to set up database structure
python manage.py migrate

# Create your admin account
python manage.py createsuperuser
# Follow prompts to set username, email, and password
```

### Step 5: Load Demo Data (Optional)

To explore DebateFlow with sample data:

```bash
python manage.py importtournament australs-demo
```

### Step 6: Start the Server

```bash
python manage.py runserver
```

Visit `http://localhost:8000` in your browser!

---

## Creating Your First Tournament

### 1. Access the Admin Interface

1. Open your browser to `http://localhost:8000`
2. Log in with the superuser credentials you created
3. You'll see the DebateFlow homepage

### 2. Create a New Tournament

**Option A: Use the Setup Wizard**

1. Click **"Start"** or **"Create Tournament"**
2. Fill in the form:
   - **Tournament Name**: "My First Tournament"
   - **Short Name**: "MFT 2024"
   - **Slug**: `mft2024` (URL-safe identifier)
3. Choose your format:
   - **British Parliamentary** (4 teams per debate)
   - **Australs** (2 teams per debate, Australasian rules)
   - **Two-Team** (generic two-team format)
4. Click **"Create Tournament"**

**Option B: Manual Creation**

1. Navigate to `/admin/tournaments/tournament/`
2. Click **"Add Tournament"**
3. Configure all settings manually

### 3. Configure Basic Settings

After creating, go to **Setup → Configuration**:

#### Essential Settings

- **Public Features**
  - [ ] Public draw (make draw visible to participants)
  - [ ] Public results (show results after release)
  - [ ] Public breaking teams
  - [ ] Public speaker tab

- **Debate Rules**
  - Substantive speakers: 3 (for BP: 2)
  - Reply speeches: Yes/No
  - Speaker score range: Min/Max
  - Team points for win/loss

- **Draw Rules**
  - Avoid same institution
  - Avoid history (teams don't meet twice)
  - Draw algorithm (Power-paired, Random, etc.)

- **Feedback**
  - Enable feedback
  - Configure questions and scales

---

## Importing Participants

### Prepare Your Data

Create CSV files with this structure:

#### teams.csv
```csv
Institution,Team,Speaker 1,Speaker 2,Speaker 3
University A,Team 1,Alice Smith,Bob Jones,Carol White
University B,Team 1,David Brown,Eve Davis,
```

#### adjudicators.csv
```csv
Name,Institution,Rating,Independent,Trainee
Judge Alice,University A,4.5,No,No
Judge Bob,University B,3.0,Yes,Yes
```

#### venues.csv
```csv
Name,Priority,Categories
Room 101,10,Large
Room 102,9,
```

### Import the Data

1. Go to **Setup → Import Data**
2. Select file type (Teams, Adjudicators, Venues)
3. Choose your CSV file
4. Click **"Import"**
5. Review any errors and fix them
6. Confirm the import

### Manual Entry

Alternatively, add participants manually:

- **Teams**: Setup → Teams → Add Team
- **Adjudicators**: Setup → Adjudicators → Add Adjudicator
- **Venues**: Setup → Venues → Add Venue

---

## Running Your First Round

### Step 1: Generate the Draw

1. Navigate to **Draw** tab
2. Click **"Generate Draw"**
3. DebateFlow will:
   - Pair teams appropriately
   - Assign sides (if applicable)
   - Create debates for all active teams

4. Review the draw:
   - Check for any conflicts
   - Make manual swaps if needed
   - Drag and drop to rearrange

5. Click **"Confirm Draw"**
6. Click **"Release Draw"** to make it public

### Step 2: Allocate Adjudicators

1. Go to **Adjudicators → Allocate Adjudicators**

2. **Automatic Allocation**:
   - Click **"Auto-Allocate"**
   - System assigns based on:
     - Adjudicator strength
     - Debate importance
     - Conflicts and clashes
     - Regional/gender balance

3. **Manual Adjustments**:
   - Drag judges between panels
   - Set chair, panelists, trainees
   - Review conflict indicators (⚠️)
   - Check panel strength meters

4. **Save and Release**:
   - Click **"Save Allocation"**
   - Click **"Release Adjudicators"** to publish

### Step 3: Assign Venues

1. Navigate to **Venues → Assign Venues**
2. Click **"Auto-Assign Venues"** or manually assign
3. Consider venue priorities and categories
4. Save assignments

### Step 4: Display the Draw

Share the draw with participants:

- **Display on Screen**: Go to public URL `/draw/`
- **Print**: Use **Display → Print Draw**
- **Project**: Use display mode for large screens

### Step 5: Collect Ballots

**Option A: Online Entry**

1. Adjudicators visit the public site
2. Go to **Enter Ballot** (private URL or login)
3. Enter:
   - Speaker scores
   - Team result
   - Optional: Speech scores
4. Submit ballot

**Option B: Printed Ballots**

1. **Print → Scoresheets**
2. Print custom ballots for each debate
3. Collect physical ballots after round
4. Tab team enters results: **Results → Enter Results**

**Option C: Tab Room Entry**

1. **Results → Enter Results**
2. Select debate
3. Enter all speaker scores
4. Choose winning team
5. Save

### Step 6: Process and Release Results

1. **Results → Check Results**
   - Verify all ballots are entered
   - Review for errors (⚠️ warnings)
   - Resolve any issues

2. **Results → Release Results**
   - Click **"Release for [Round]"**
   - Results become public
   - Standings are updated

### Step 7: Advance to Next Round

1. **Standings** tab shows updated team rankings
2. Click **"Advance to Next Round"**
3. Repeat the process for subsequent rounds

---

## Complete Tournament Workflow

### Pre-Tournament

- [ ] Create tournament
- [ ] Configure settings and rules
- [ ] Import or enter teams, adjudicators, venues
- [ ] Set up break categories (if applicable)
- [ ] Test with demo round (optional)
- [ ] Share access URLs with stakeholders

### During Preliminary Rounds

For each round:
1. [ ] Generate draw (or use pre-set draw)
2. [ ] Allocate adjudicators
3. [ ] Assign venues
4. [ ] Release draw
5. [ ] Debates occur
6. [ ] Collect ballots
7. [ ] Enter results
8. [ ] Check and release results
9. [ ] Collect feedback (optional)
10. [ ] Advance to next round

### Break Rounds

- [ ] **Breaks → Generate Break**
- [ ] Select break category
- [ ] Review breaking teams
- [ ] Resolve ties if needed
- [ ] Announce the break
- [ ] Run elimination rounds (same as prelims)

### Post-Tournament

- [ ] Release final tab
- [ ] Export data for records
- [ ] Review feedback
- [ ] Archive tournament

---

## Tips and Best Practices

### Before the Tournament

1. **Test Everything**: Run a practice round with test data
2. **Train Your Team**: Ensure tab staff know how to enter results
3. **Backup Plan**: Have printed ballots ready if tech fails
4. **Set Permissions**: Configure who can see what information
5. **Communication**: Share the public URL with all participants

### During the Tournament

1. **Check-Ins**: Use check-in feature to track attendance
2. **Monitor Feedback**: Address adjudicator concerns promptly
3. **Stay Updated**: Keep DebateFlow running smoothly
4. **Regular Backups**: Export data regularly
5. **Clear Communication**: Update participants on delays or changes

### Common Configurations

**For British Parliamentary:**
- 4 teams per debate (OG, OO, CG, CO)
- 2 substantive speakers per team
- No reply speeches
- Score range: 65-90 per speaker

**For Australs/Two-Team:**
- 2 teams per debate (Affirmative/Negative)
- 3 substantive speakers per team
- 1 reply speaker per team
- Score range: 70-80 per speaker

### Adjudicator Allocation Tips

- **High-quality judges** for high-impact debates
- **Avoid conflicts**: Institution, history, personal
- **Balance panels**: Mix experienced with trainees
- **Regional diversity**: Consider for fairness
- **Review carefully**: Manual check is important

---

## Troubleshooting

### Installation Issues

**Problem: `pipenv install` fails**
```bash
# Try with Python 3.11 specifically
pipenv --python 3.11 install
```

**Problem: npm build errors**
```bash
# Clear cache and reinstall
rm -rf node_modules package-lock.json
npm install
npm run build
```

**Problem: Database migration errors**
```bash
# Reset database (⚠️ deletes all data)
rm db.sqlite3
python manage.py migrate
```

### Runtime Issues

**Problem: Can't log in**
- Check superuser was created: `python manage.py createsuperuser`
- Verify username and password
- Clear browser cache

**Problem: CSS/styles not loading**
```bash
# Rebuild assets
npm run build
python manage.py collectstatic --noinput
```

**Problem: "Permission denied" errors**
- Check file permissions
- On Linux/Mac: `chmod +x manage.py`
- Run as appropriate user

### Tournament Issues

**Problem: Can't generate draw**
- Ensure you have enough active teams
- Check that previous round results are entered
- Verify debate format settings

**Problem: Import fails**
- Check CSV format matches examples
- Ensure UTF-8 encoding
- Look for special characters or formatting issues

**Problem: Ballots won't submit**
- Check all required fields are filled
- Verify score ranges are correct
- Ensure internet connection (for online entry)

### Getting More Help

- Check the [full documentation](docs/)
- Look for similar issues on GitHub
- Review Tabbycat documentation (most applies to DebateFlow)
- Contact support with specific error messages

---

## Next Steps

Now that you know the basics:

1. 📖 **Explore Features**: Read [docs/features/](docs/features/) for advanced capabilities
2. 🎯 **Customize**: Adjust settings to match your tournament format
3. 🔧 **Optimize**: Configure for your specific needs
4. 📊 **Analyze**: Use reports and exports for insights
5. 🌟 **Contribute**: Share improvements back to the community

**Happy tabbing!** 🎤💙

If you have questions or suggestions, please open an issue on GitHub or consult the full documentation.
