# DebateFlow Quick Reference

A quick reference guide for common DebateFlow operations.

## 🚀 Quick Commands

### Development Server
```bash
# Start server
python manage.py runserver

# Start with specific port
python manage.py runserver 0.0.0.0:8080

# Build CSS/JS assets
npm run build

# Watch and rebuild SCSS
npm run serve-sass
```

### Database Operations
```bash
# Run migrations
python manage.py migrate

# Create superuser
python manage.py createsuperuser

# Reset database (⚠️ deletes all data!)
python manage.py flush

# Backup database
python manage.py dumpdata > backup.json

# Restore database
python manage.py loaddata backup.json
```

### Data Import/Export
```bash
# Import a demo tournament
python manage.py importtournament australs-demo

# Export tournament data
python manage.py exporttournament <slug> --out=export.json
```

## 🔄 Tournament Workflow

### Round-by-Round Checklist

```
Pre-Round:
 1. ✓ Generate Draw
 2. ✓ Allocate Adjudicators  
 3. ✓ Assign Venues
 4. ✓ Release Draw
 5. ✓ (Optional) Print Materials

During Round:
 6. ✓ Debates Occur
 7. ✓ (Optional) Check-In Tracking

Post-Round:
 8. ✓ Enter Results
 9. ✓ Check for Errors
10. ✓ Release Results
11. ✓ (Optional) Collect Feedback
```

## 📊 Common URLs

### Admin Interface
```
/                          # Homepage
/admin/                    # Django admin
/<tournament-slug>/        # Tournament homepage
```

### Tournament Management
```
/<slug>/setup/             # Tournament setup
/<slug>/draw/              # Draw management
/<slug>/adjudicators/      # Adjudicator allocation
/<slug>/venues/            # Venue assignment
/<slug>/results/           # Results entry
/<slug>/standings/         # Current standings
/<slug>/breaks/            # Break rounds
```

### Public Pages
```
/<slug>/draw/              # Public draw
/<slug>/results/           # Public results
/<slug>/tab/team/          # Team tab
/<slug>/tab/speaker/       # Speaker tab
/<slug>/feedback/          # Feedback submission
```

### Data Management
```
/<slug>/data/import/       # Import participants
/<slug>/data/export/       # Export tournament data
/<slug>/participants/      # Manage participants
```

## 💡 Quick Tips

### Draw Generation
- **Power-paired**: Teams with similar records face each other
- **Random**: Completely random pairings
- **Fold**: Top half vs bottom half
- **Pull-up**: Handle odd teams by pulling from lower bracket

### Adjudicator Allocation
- **Auto-allocate**: Uses algorithm for optimal distribution
- **Drag-and-drop**: Manual control over all assignments
- **Conflict indicators**: ⚠️ shows when conflicts exist
- **Panel strength**: Green = strong, Red = weak

### Score Ranges

| Format | Typical Range | Notes |
|--------|--------------|-------|
| BP | 65-90 per speaker | Substantive speeches |
| Australs | 70-80 per speaker | Tighter range |
| WUDC | 65-90 per speaker | Similar to BP |

### Break Categories

Common break sizes:
- **Quarters**: Top 8 teams (3 elim rounds)
- **Octos**: Top 16 teams (4 elim rounds)
- **Novice**: Restricted eligibility

## 🎯 Feature Quick Access

### Enable/Disable Features

In **Setup → Configuration → Public Features**:

| Feature | Description |
|---------|-------------|
| Public Draw | Anyone can see the draw |
| Public Results | Anyone can see results |
| Public Breaking Teams | Show break announcements |
| Public Tab | Display team/speaker rankings |
| Ballots Online | Online ballot submission |
| Feedback | Adjudicator feedback system |
| Check-Ins | Track attendance |

### Data Import Format

**teams.csv**
```csv
Institution,Team,Speaker 1,Speaker 2,Speaker 3
```

**adjudicators.csv**
```csv
Name,Institution,Rating,Independent,Trainee
```

**venues.csv**
```csv
Name,Priority,Categories
```

## 🔧 Common Configurations

### British Parliamentary Tournament
```python
Format: British Parliamentary
Teams per debate: 4
Substantive speakers: 2
Reply speeches: No
Score range: 65-90
```

### Australs Tournament
```python
Format: Australs
Teams per debate: 2
Substantive speakers: 3
Reply speeches: Yes
Score range: 70-80
```

## 📱 Mobile-Friendly Features

- **Responsive design**: Works on phones and tablets
- **Check-in**: Quick attendance tracking
- **Ballot entry**: Judges can enter on mobile
- **Draw display**: Easy viewing on any device

## ⚡ Performance Tips

### For Large Tournaments (100+ teams)

1. **Use PostgreSQL** instead of SQLite
2. **Enable caching** with Redis
3. **Optimize queries** in settings
4. **Pre-allocate** adjudicators when possible
5. **Limit public features** to reduce load

### Database Configuration
```bash
# In environment or settings
DATABASE_URL=postgresql://user:pass@localhost/dbname
REDIS_URL=redis://localhost:6379
```

## 🐛 Quick Fixes

### CSS Not Loading
```bash
npm run build
python manage.py collectstatic --noinput
```

### Import Errors
- Check CSV encoding is UTF-8
- Remove special characters
- Ensure column headers match exactly

### Can't Generate Draw
- Verify enough active teams
- Check previous round is complete
- Review debate format settings

### Adjudicator Conflicts Not Showing
- Ensure conflicts are defined in system
- Check conflict types are enabled
- Review conflict UI settings

## 📊 Reports & Exports

### Available Reports
- **Team Tab**: Full team standings
- **Speaker Tab**: Individual speaker rankings
- **Motion Balance**: How teams performed on different sides
- **Feedback**: Aggregated adjudicator feedback
- **Diversity**: Regional, gender, institution statistics

### Export Formats
- **CSV**: For spreadsheet analysis
- **JSON**: For data processing
- **PDF**: For printing and sharing

## 🔐 Security Settings

### Production Checklist
- [ ] Set `DEBUG=False`
- [ ] Use strong `SECRET_KEY`
- [ ] Enable HTTPS
- [ ] Set `ALLOWED_HOSTS`
- [ ] Configure CSRF settings
- [ ] Use environment variables
- [ ] Regular backups
- [ ] Restrict admin access

## 🌐 Multi-Language Support

DebateFlow supports multiple languages:
- English (default)
- Spanish
- French
- Japanese
- And more...

Change in **Footer → Language** selector

## 📞 Getting Help

1. **Documentation**: Check [README.md](README.md) and [GETTING_STARTED.md](GETTING_STARTED.md)
2. **Issues**: Search [GitHub Issues](https://github.com/lucaskj727-cloud/tabbycat/issues)
3. **Original Docs**: [Tabbycat documentation](https://tabbycat.readthedocs.io)

## 🎓 Learning Resources

### New to Debate Tabulation?
1. Read the [Getting Started Guide](GETTING_STARTED.md)
2. Import the demo tournament to explore
3. Practice with small test tournaments
4. Review the [Tournament Logistics Guide](docs/guide/tournament-logistics.html)

### Advanced Users
1. Explore [API Documentation](docs/features/api.html)
2. Customize [Draw Rules](docs/features/draw-generation.html)
3. Configure [Standings Rules](docs/features/standings-rules.html)
4. Set up [Notifications](docs/features/notifications.html)

---

**Remember**: Always test your setup before the actual tournament! 🎤💙
