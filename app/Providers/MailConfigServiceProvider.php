<?php

namespace App\Providers;

use Illuminate\Support\Facades\Config;
use Illuminate\Support\ServiceProvider;

class MailConfigServiceProvider extends ServiceProvider
{
    public function register()
    {
        //
    }

    public function boot()
    {
        if (application_installed(true)) {
            if ($fromAddress = email_setting("from_address", env('MAIL_FROM_ADDRESS', 'noreply@yourdomain.com'))) {
                Config::set("mail.from.address", $fromAddress);
            }
    
            if ($fromName = email_setting("from_name", env('MAIL_FROM_NAME', 'TokenLite'))) {
                Config::set("mail.from.name", $fromName);
            }
    
            $driver = email_setting("driver", env('MAIL_DRIVER', 'sendmail'));
            if ($driver == "sendmail") {
                Config::set("mail.default", "sendmail");
            } elseif ($driver == "smtp") {
                $config = array(
                    'transport'     => "smtp",
                    'host'       => email_setting("host", env('MAIL_HOST', 'smtp.mailgun.org')),
                    'port'       => email_setting("port", env('MAIL_PORT', 587)),
                    'encryption' => email_setting("encryption", env('MAIL_ENCRYPTION', 'tls')),
                    'username'   => email_setting("user_name", env('MAIL_USERNAME')),
                    'password'   => email_setting("password", env('MAIL_PASSWORD')),
                    'timeout' => null,
                    'auth_mode' => null,
                );
    
                Config::set("mail.default", "smtp");
                Config::set("mail.mailers.smtp", $config);
            }
    
            Config::set("mail.markdown.theme", 'nio-mail');
        }
    }
}
