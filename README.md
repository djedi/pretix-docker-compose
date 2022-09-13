# Setting Up Self-Hosted Pretix with Docker Compose

1. Clone this repo to your server.
1. Edit `pretix.cfg` as needed. You do not need to change domain from
   `example.com`. You will be prompted to enter your domain name on the setup
   script and every instance of `example.com` will be replaced with your domain.
1. Run the setup script

   ```shell
   ./setup.sh
   ```

   This script will do the following:

   1. Prompt for domain name and replace `example.com` in various files.
   2. Prompt for your email address to use with LetsEncrypt.
   3. Install Portainer to manage docker via online GUI.
   4. Creates various data directories needed
   5. Get temporary SSL Certificate in order to start nginx with SSL
   6. Runs `docker-compose up` to spin up pretix, postgresl, redis, nginx, and certbot
   7. Adds cronjob for pretix

1. Navigate to [https://YOURDOMAIN.com/control](.)

   - user: admin@localhost
   - password: admin

1. Change default login settings
