do_lesson_function = ->
  $(this).find("input").prop("checked",true)
  $(".answer_counting").html "1/20"
  sum = 1
  $(".word-selected").click ->
    sum += 1
    if sum <= 20
      $(".answer_counting").html sum + "/" + 20
      $(this).find("input").prop("checked",true)
      $(this).parent().parent().hide().next().next().show()
      if sum == 20
        $(".submit-answer").removeClass("hidden")
    false

$(document).on("click", ".word-selected", do_lesson_function)