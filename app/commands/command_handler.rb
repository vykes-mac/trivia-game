module CommandHandler
  def handle_command(json_root, command)
    if command.success?
      render json: { "#{json_root}": true }
    else
      render json: { error: command.errors }
    end
  end
end
