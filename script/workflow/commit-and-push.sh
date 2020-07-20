#!/bin/sh

set -euo

: "${TAG:?Please set the TAG environment variable}"

git add pact_broker/Gemfile.lock
git commit -m "feat(deps): update ${RELEASED_GEM_NAME} gem to version ${RELEASED_GEM_VERSION}"

bundle exec conventional-changelog version=${TAG}
git add CHANGELOG.md
git commit -m "chore(release): version ${TAG}"

git tag -a "${TAG}" -m "chore(release): version ${TAG}"
git push origin master --follow-tags