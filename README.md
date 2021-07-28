# FindMyPersonal

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

To start your Phoenix Server Container-Prod:

  * configure a `.env`with:
    * DATABASE_URL
    * SECRETS_KEY_BASE
    * OPTIONAL: POOL_SIZE and PORT
  * run `docker build -t IMAGE_NAME:TAG``
  * run `docker run --env-file .env -p 8080:4000 IMAGE_NAME:TAG`

  Acessar deployado no Cloud Run:
  API: https://find-my-personal-elxpro-52wninh63q-oa.a.run.app/api/teachers
  Browser: https://find-my-personal-elxpro-52wninh63q-oa.a.run.app/teachers
