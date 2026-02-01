#!/bin/bash
# Quick deployment script for DebateFlow demo

set -e

echo "🎯 DebateFlow Quick Deploy Script"
echo "=================================="
echo ""

# Set up PostgreSQL
echo "📊 Setting up PostgreSQL database..."
sudo service postgresql start
sudo -u postgres psql -c "DROP DATABASE IF EXISTS debateflow;" || true
sudo -u postgres psql -c "CREATE DATABASE debateflow;"
sudo -u postgres psql -c "DROP ROLE IF EXISTS debateflow;" || true
sudo -u postgres psql -c "CREATE USER debateflow WITH PASSWORD 'debateflow';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE debateflow TO debateflow;"
echo "✓ Database ready"
echo ""

# Set environment for Heroku-like setup (includes postgres app)
echo "⚙️  Configuring environment..."
export DATABASE_URL="postgresql://debateflow:debateflow@localhost/debateflow"
export SECRET_KEY="debateflow-demo-key-$(date +%s)"
export DEBUG="1"
export ON_HEROKU="1"  # Use Heroku settings which include postgres
export DISABLE_SENTRY="True"
export TIME_ZONE="UTC"

echo "✓ Environment configured"
echo ""

# Build frontend assets
echo "🎨 Building frontend assets..."
npm run build 2>&1 | tail -5
echo "✓ Frontend assets built"
echo ""

# Run migrations
echo "📝 Running database migrations..."
python3 -m pipenv run python manage.py migrate
echo "✓ Migrations complete"
echo ""

# Create superuser
echo "👤 Creating admin user..."
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.filter(username='admin').exists() or User.objects.create_superuser('admin', 'admin@debateflow.local', 'admin')" | python3 -m pipenv run python manage.py shell
echo "✓ Admin user created (username: admin, password: admin)"
echo ""

# Import demo tournament
echo "🎲 Loading demo tournament..."
python3 -m pipenv run python manage.py importtournament australs-demo 2>&1 | tail -5 || echo "Demo import skipped"
echo ""

# Start server
echo "🚀 Starting DebateFlow server..."
echo ""
echo "========================================="
echo "  DebateFlow is now running!"
echo "========================================="
echo ""
echo "  🌐 URL: http://localhost:8000"
echo "  👤 Admin: admin"
echo "  🔑 Password: admin"
echo ""
echo "  Press Ctrl+C to stop"
echo ""

export DATABASE_URL="postgresql://debateflow:debateflow@localhost/debateflow"
export ON_HEROKU="1"
python3 -m pipenv run python manage.py runserver 0.0.0.0:8000
