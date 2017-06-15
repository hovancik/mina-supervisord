namespace :supervisord do
  set :supervisorctl_cmd,       -> { "sudo supervisorctl" }

  desc "Start a supervisord program"
  task :start, [:program] do |t, args|
    command %[#{fetch(:supervisorctl_cmd)} start #{args[:program]}]
  end

  desc "Restart a supervisord program"
  task :restart, [:program] do |t, args|
    command %[#{fetch(:supervisorctl_cmd)} restart #{args[:program]}]
  end

  namespace :restart do
    desc "Restart a supervisord program or start it if not running"
    task :or_start, [:program] do |t, args|
      command %[
        CMD="$(#{fetch(:supervisorctl_cmd)} status #{args[:program]})";
        RES=($CMD);
        if [ ${RES[1]} == "RUNNING" ]; then
          #{fetch(:supervisorctl_cmd)} restart #{args[:program]};
        else
          #{fetch(:supervisorctl_cmd)} start #{args[:program]};
        fi
      ]
    end
  end

  desc "Stop a supervisord program"
  task :stop, [:program] do |t, args|
    command %[#{fetch(:supervisorctl_cmd)} stop #{args[:program]}]
  end

  desc "Get status of a supervisord program"
  task :status, [:program] do |t, args|
    command %[#{fetch(:supervisorctl_cmd)} status #{args[:program]}]
  end

  desc "Send custom SIGNAL to a supervisord program"
  task :signal, [:program, :signal] do |t, args|
    command %[#{fetch(:supervisorctl_cmd)} signal #{args[:signal]} #{args[:program]}]
  end

  namespace :signal do
    desc "Send custom SIGNAL to a supervisord program or start it if not running"
    task :or_start, [:program, :signal] do |t, args|
      command %[
        CMD="$(#{fetch(:supervisorctl_cmd)} status #{args[:program]})";
        RES=($CMD);
        if [ ${RES[1]} == "RUNNING" ]; then
          #{fetch(:supervisorctl_cmd)} signal #{args[:signal]} #{args[:program]};
        else
          #{fetch(:supervisorctl_cmd)} start #{args[:program]};
        fi
      ]
    end
  end
end
