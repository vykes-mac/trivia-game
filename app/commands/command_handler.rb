module CommandHandler
  def handle_command(json_root, command)
    if command.success?
      render json: { "#{json_root}": command.result }
    else
      render json: { error: command.errors }
    end
  end
end
