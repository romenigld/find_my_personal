echo "-------------START BUILD-------------"
set -ex;
docker build -t "${IMAGE}:SHA" . && \
docker push "${IMAGE}:SHA" && \
gcloud beta run deploy "${CLOUD_RUN_SERVICE}" \
  --set-env-vars DATABASE_URL=$DATABASE_URL \
  --set-env-vars SECRET_KEY_BASE=$SECRET_KEY_BASE \
  --set-env-vars POOL_SIZE="2" \
  --set-env-vars SERVER_HOST_MAIL=$SERVER_HOST_MAIL \
  --set-env-vars PORT_MAIL=$PORT_MAIL \
  --set-env-vars USER_NAME_MAIL=$USER_NAME_MAIL \
  --set-env-vars PASSWORD_MAIL=$PASSWORD_MAIL \
  --image="${IMAGE}:SHA" \
  --platform=managed \
  --region="${CLOUD_RUN_REGION}" \
  --allow-unauthenticated;
set +x
echo "-------------DEPLOY FINISHED-------------"
