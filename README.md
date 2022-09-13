# Setting Up Self-Hosted Pretix with Docker Compose

1. Clone this repo to your server.
1. Edit `pretix.cfg` as needed. You do not need to change domain from
   `example.com`. You will be prompted to enter your domain name on the setup
   script and every instance of `example.com` will be replaced with your domain.
1. Run the setup script

   ```shell
   ./setup.sh
   ```

1. Navigate to [https://YOURDOMAIN.com/control](.)

   - user: admin@localhost
   - password: admin

1. Change default login settings
