INDICES =
  1 : "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3021.9783921877683!2d-73.97635568459349!3d40.762499979326506!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x8e9cfc7444d8f876!2sTrump+Tower!5e0!3m2!1sfr!2sus!4v1489314254841"

QRCODE_SIZE = 128

num = new Array
den = new Array
val = undefined
limit = 1000
  
compile = (prog) ->
  regex = /\s*(\d*)\s*\/\s*(\d*)\s*(.*)/m
  while regex.test(prog)
    num.push regex.exec(prog)[1]
    den.push regex.exec(prog)[2]
    prog = regex.exec(prog)[3]
  return

dump = (prog) ->
  i = 0
  while i < num.length
    document.body.innerHTML += num[i] + '/' + den[i] + ' '
    i++
  document.body.innerHTML += '<br>'
  return

step = (val) ->
  i = 0
  while i < den.length and val % den[i] != 0
    i++
  return (num[i] * val / den[i])

exec = (val) ->
  i = 0
  while val and i < limit
    document.body.innerHTML += i + ': ' + val + '<br>'
    r = val
    val = step(val)
    i++
  return r

$ -> 
  $( "body" ).on "click", ".close", -> $( "#indice" ).hide()
  $( "#indice").draggable()
  $( "#indice").hide()
    
  $( "body" ).on "click", "#reponse1", ->
    x = prompt "Entrer votre réponse (un nombre)", ""
    if (x != null) and (parseInt(x) is 4)
      $( "#gmaps").attr "src", INDICES[1]
      $( "#qrcode" ).qrcode
        width: QRCODE_SIZE
        height: QRCODE_SIZE
        text: INDICES[1]
      $( "#indice" ).show()
    else
      alert "Désolé ! ce n'est pas ça !"
  
  $( "body" ).on "click", "#reponse2", ->
    x = parseInt( $( "#input2" ).val() )
    v = prompt "Entrer votre réponse (un nombre)", ""
    v = parseInt(v)
    compile "5/2 3/25 1/5"
    r = exec(x)
    if (r is v)
      $( "#gmaps").attr "src", INDICES[1]
      $( "#qrcode" ).qrcode
        width: QRCODE_SIZE
        height: QRCODE_SIZE
        text: INDICES[1]
      $( "#indice" ).show().draggable()
    else
      alert "Désolé ! ce n'est pas ça !"

