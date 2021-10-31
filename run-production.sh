export SECRET_KEY_BASE=38e7650bdcbef8e5bd84034b93f8da6a53e6ea4c70a760007a6e6c4bd6d33281315c7abf282062054863c3d186cd0b02a9b2bc85527450a43ea63bfe79dff21c
export RAILS_SERVE_STATIC_FILES=true

rm -R "tmp"
rm -R "public/assets"
RAILS_ENV=production rails db:migrate:reset DISABLE_DATABASE_ENVIRONMENT_CHECK=1
RAILS_ENV=production rails db:seed
RAILS_ENV=production rails assets:precompile

rails server --environment production