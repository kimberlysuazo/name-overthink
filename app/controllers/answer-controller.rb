post '/questions/:question_id/answers/new' do
  answer = Answer.new(question_id: params[:question_id], user_id: current_user.id, content: params[:content])
  @question = Question.find(params[:question_id])

  if answer.save
    redirect "questions/#{params[:question_id]}"
  else
    @answer_errors = answer.errors.full_messages
    erb :'questions/show'
  end
end

delete '/answers/:answer_id' do
  answer = Answer.find_by(id: params[:answer_id])
  user_id = answer.user_id
  answer.destroy

  redirect "/users/#{user_id}"
end
