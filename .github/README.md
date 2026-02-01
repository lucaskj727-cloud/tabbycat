<div align="center">

![DebateFlow Logo](../tabbycat/static/logo.svg)

# DebateFlow

[![License](https://img.shields.io/badge/license-AGPL--3.0-blue.svg)](../LICENSE.md)
[![Repository](https://img.shields.io/badge/repo-lucaskj727--cloud%2Ftabbycat-blue)](https://github.com/lucaskj727-cloud/tabbycat)

**Advanced tournament tabulation system for parliamentary debate**

</div>

DebateFlow is a comprehensive debate tournament management system for British Parliamentary and two-team parliamentary formats. Used by tournaments worldwide including Australs, EUDC, WUDC, and hundreds of local competitions.

**Want to try it out?** The best way to trial DebateFlow is to install it locally or deploy to a cloud platform as described [below](#-installation). See the [Getting Started Guide](../GETTING_STARTED.md) for a complete walkthrough.

## 🔍 Features

- A range of setup options. Tabbycat powers Calico, a paid service for hosting tournaments. Tabbycat can also run as a local installation (natively, or via Docker) and be deployed to the free-tiers of the Render or Heroku platforms.
- Enter data from multiple computers simultaneously and (optionally) display results, draws, and other information online
- Collect ballots and feedback online, or from printed forms customised for each round ( adjudicator feedback questions and rankings [are configurable](http://tabbycat.readthedocs.io/en/stable/features/adjudicator-feedback.html))
- Automated adjudicator allocations based on adjudicator ranking, debate priority, and conflicts/clashes
- A drag and drop interface for adjudicator allocation that displays conflicts alongside break liveness and gender/regional/language balance considerations
- A responsive interface that adapts to suit large screens, laptops, tablets, and phones
- Support for British Parliamentary (EUDC/WUDC), Australs, NZ Easters, Australian Easters, Joynt Scroll, UADC, and WSDC rule sets as well as configurable [draw generation rules](http://tabbycat.readthedocs.io/en/stable/features/draw-generation.html) and [team standings rules](http://tabbycat.readthedocs.io/en/stable/features/standings-rules.html)

## 📖 Documentation

- **[README](../README.md)** - Overview and quick start
- **[Getting Started Guide](../GETTING_STARTED.md)** - Step-by-step tutorial
- **[Quick Reference](../USAGE.md)** - Common commands and workflows
- **[Full Documentation](../docs/)** - Comprehensive guides
- **[Original Tabbycat Docs](http://tabbycat.readthedocs.io/)** - Most guides still apply

## ⬆️ Installation

### Quick Install (Local)

```bash
git clone https://github.com/lucaskj727-cloud/tabbycat
cd tabbycat
pip install pipenv && pipenv install && pipenv shell
npm install && npm run build
python manage.py migrate
python manage.py createsuperuser
python manage.py runserver
```

Visit `http://localhost:8000` to get started!

### Cloud Deployment

- **Heroku**: Follow [Heroku installation guide](docs/install/heroku.html)
- **Render**: Use the included `render.yaml` configuration
- **Docker**: Use the provided `Dockerfile` and `docker-compose.yml`

See the [Getting Started Guide](../GETTING_STARTED.md) for detailed instructions.

## 💪 Support and Contributing

**Need Help?**
- Check the [Documentation](../README.md)
- Review the [Getting Started Guide](../GETTING_STARTED.md)
- Search [GitHub Issues](https://github.com/lucaskj727-cloud/tabbycat/issues)
- Consult [original Tabbycat documentation](http://tabbycat.readthedocs.io/)

**Contributing**

Contributions are welcome! Fork the repository, make your changes, and submit a pull request.

## 📄 License

DebateFlow is licensed under the [GNU Affero General Public License v3.0](../LICENSE.md). You may copy, distribute, and modify this software, but all modifications must be made public and remain under the same license.

## 🙏 Credits

DebateFlow is based on [Tabbycat](https://github.com/TabbycatDebate/tabbycat), created by:
- Qi-Shan Lim (original author, Auckland Australs 2010)
- Philip Belesky
- Chuan-Zheng Lee
- Étienne Beaulé

Rebranded as DebateFlow with custom visual identity while preserving the excellent core functionality.

## 🔗 Links

- **This Repository**: https://github.com/lucaskj727-cloud/tabbycat
- **Original Tabbycat**: https://github.com/TabbycatDebate/tabbycat
- **Documentation**: [README](../README.md) | [Getting Started](../GETTING_STARTED.md) | [Quick Reference](../USAGE.md)
