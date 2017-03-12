INDICES =
  1 : "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3021.9783921877683!2d-73.97635568459349!3d40.762499979326506!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x8e9cfc7444d8f876!2sTrump+Tower!5e0!3m2!1sfr!2sus!4v1489314254841"

$ ->
  $( "#indice").dialog
    width : "600px"
    autoOpen: false
    title: "Bravo ! C'est la bonne réponse !"
  $( "#reponse1" ).on "click", ->
    x = prompt "Entrer votre réponse (un nombre)", ""
    if (x != null) and (parseInt(x) is 2)
      $( "#gmaps").attr "src", INDICES[1]
      $( "#qrcode" ).qrcode
        width: 64
        height: 64
        text: INDICES[1]
      $( "#indice").dialog "open"
    else
      alert "Désolé ! ce n'est pas ça !"

