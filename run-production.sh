export SECRET_KEY_BASE=
export RAILS_SERVE_STATIC_FILES=true

rm -R "tmp"
rm -R "public/assets"
RAILS_ENV=production rails db:migrate:reset DISABLE_DATABASE_ENVIRONMENT_CHECK=1
RAILS_ENV=production rails db:seed
RAILS_ENV=production rails assets:precompile

rails server --environment production