class RecommendedPlaceModel {
  final String name;
  final String image;
  final double rating;
  final String location;
  final String estimatedTime;
  final String description;
  final String recommendations; // Recomendaciones
  final String precautions; // Nueva propiedad de descripción

  RecommendedPlaceModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.location,
    required this.estimatedTime,
    required this.description,
    required this.recommendations,
    required this.precautions, // Inicializamos la descripción
  });
}

// Datos de ejemplo con descripción única para cada lugar
List<RecommendedPlaceModel> recommendedPlaces = [
  RecommendedPlaceModel(
    name: "Castillo de Lamas",
    image: "assets/places/place1.jpg",
    rating: 4.7,
    location: "Ciudad de Lamas",
    estimatedTime: "00d:0h:45m",
    description:
        "El Castillo de Lamas es una construcción de estilo medieval en pleno corazón de la selva amazónica. Ofrece vistas panorámicas de la ciudad y el entorno natural. Este castillo único no solo es un atractivo turístico, sino también un espacio cultural con diversas exposiciones. Las paredes del castillo albergan una historia rica y el lugar es conocido por su belleza arquitectónica.",
    recommendations:
        "Contrata un guía local para conocer la historia completa del castillo y su construcción,No olvides llevar una cámara o celular con suficiente batería para capturar las vistas espectaculares desde las torres,Lleva ropa ligera pero apropiada para caminar por terrenos irregulares o en escaleras,Llega temprano para disfrutar de una visita tranquila y sin multitudes,Aprovecha para recorrer los alrededores del castillo y disfrutar del paisaje natural que lo rodea,El castillo ofrece exposiciones culturales, aprovecha para aprender sobre la historia de la región,Si prefieres relajarte, el área alrededor del castillo tiene bancos y espacios tranquilos donde puedes disfrutar del ambiente,Si decides hacer preguntas a los guías o al personal del lugar, mantén una actitud respetuosa para aprovechar mejor la experiencia",
    precautions:
        "Ten cuidado al subir y bajar las escaleras del castillo, algunas pueden estar resbaladizas o empinadas,No te acerques demasiado a los bordes de las torres sin protección, ya que las caídas pueden ser peligrosas,Usa zapatos cómodos y antideslizantes para caminar por el castillo y sus alrededores,Respeta las normas del lugar y no toques las piezas expuestas para preservar su estado,El clima puede ser caluroso y húmedo, por lo que es importante llevar agua y protección solar,No dejes basura y ayuda a preservar el entorno natural y la arquitectura del lugar,Si eres sensible a las alturas, mantente alejado de los bordes de las torres para evitar vértigo o mareos,Asegúrate de verificar los horarios de apertura del castillo, especialmente durante días festivos o la temporada baja",
  ),
  RecommendedPlaceModel(
    name: "Laguna Azul",
    image: "assets/places/place7.jpg",
    rating: 4.5,
    location: "Sauce",
    estimatedTime: "00d:2h:00m",
    description:
        "La Laguna Azul es un lago de aguas cristalinas rodeado de una impresionante selva amazónica. Es el lugar perfecto para realizar actividades acuáticas como paseos en bote o kayak. La laguna tiene un ambiente tranquilo y natural que invita a relajarse y disfrutar del paisaje.",
    recommendations:
        "Llega temprano para aprovechar al máximo el día y evitar las multitudes,Lleva ropa ligera y cómoda para estar en contacto con el agua,Lleva un sombrero y protector solar para protegerte del sol,Si te gustan las actividades acuáticas alquila un bote o kayak para recorrer la laguna,Disfruta de la gastronomía local en los restaurantes cercanos,Lleva agua potable y algunos snacks para tu comodidad,Si te interesa la fotografía no olvides llevar una cámara para capturar las impresionantes vistas,Si viajas en grupo o familia realiza un picnic en las zonas de descanso cerca de la laguna",
    precautions:
        "Usa chaleco salvavidas si planeas hacer actividades acuáticas,No te adentres en el agua sin supervisión especialmente si no sabes nadar,Mantente alejado de la orilla si las aguas están agitadas,Evita caminar por zonas resbaladizas cerca de la laguna,Lleva repelente de insectos ya que en la zona hay mosquitos,Consulta el pronóstico del tiempo antes de viajar ya que el clima puede cambiar rápidamente,No dejes basura ni contamines el agua mantén la limpieza del lugar,No te acerques a áreas profundas si no tienes experiencia en nado", // Descripción única
  ),
  RecommendedPlaceModel(
    name: "Río Tioyacu",
    image: "assets/places/place8.jpg",
    rating: 4.0,
    location: "Rioja ",
    estimatedTime: "00d:3h:45m",
    description:
        "El Río Tioyacu es conocido por su origen en las montañas, donde el agua brota de una fuente natural cristalina. Es un lugar ideal para disfrutar de la belleza natural de la selva peruana y sus aguas frescas. El entorno está rodeado de vegetación y fauna amazónica, lo que lo convierte en un destino perfecto para ecoturismo y caminatas suaves.",
    recommendations:
        "Visita el lugar temprano para disfrutar del paisaje sin mucha gente,Lleva ropa cómoda y ligera para caminar por el sendero que lleva a la naciente,Si te interesa la fotografía captura el paisaje y la flora local,Llévate suficiente agua para mantenerte hidratado durante la caminata,Si te gusta la naturaleza haz una parada para observar las aves y animales de la zona,Si eres un amante de la pesca considera llevar equipo para pescar en las aguas del río,Lleva repelente de insectos para evitar picaduras de mosquitos,Si tienes la oportunidad contrata un guía local para que te explique sobre la flora y fauna del área",
    precautions:
        "Mantente en los senderos marcados para evitar perderte o dañar el ecosistema local,Evita nadar si no tienes experiencia en corrientes de agua natural,Ten cuidado con las rocas resbaladizas cerca de la fuente del río,Si viajas con niños mantenlos siempre supervisados cerca del agua,Usa calzado adecuado para caminar en terrenos húmedos y rocosos,No toques ni alteres la flora o fauna local ya que algunas especies pueden ser peligrosas,Lleva protector solar aunque el lugar es sombreado, el sol puede ser fuerte durante el día,Respeta la tranquilidad del lugar y evita hacer ruido innecesario para no perturbar la fauna local", // Descripción única
  ),
  RecommendedPlaceModel(
    name: "Catarata Ahushiyacu",
    image: "assets/places/place6.jpg",
    rating: 4.9,
    location: "Tarapoto",
    estimatedTime: "00d:00h:30m",
    description:
        "La Catarata de Ahuashiyacu es una impresionante caída de agua de 40 metros de altura, rodeada de exuberante vegetación selvática. Su piscina natural es ideal para un baño refrescante. El nombre Ahuashiyacu proviene del quechua y significa agua cantarina.",
    recommendations:
        "Utiliza calzado antideslizante y ropa cómoda para la caminata hacia la catarata,Aplica bloqueador solar y lleva un sombrero o gorra para protegerte del sol,Lleva agua para mantenerte hidratado durante el recorrido,No olvides tu cámara o smartphone para capturar las vistas panorámicas y la belleza del lugar,No dejes basura y sigue los senderos establecidos para preservar el ecosistema,Si decides nadar, ten precaución con las corrientes y las rocas resbaladizas,Se recomienda visitar en la mañana para evitar la multitud y disfrutar de temperaturas más frescas,Considera contratar un guía para conocer más sobre la flora y fauna local",
    precautions:
        "El sendero hacia la catarata puede ser resbaladizo; camina con precaución y evita correr,No te acerques demasiado al borde de la cascada ni a zonas con corrientes fuertes,Usa repelente para evitar picaduras de mosquitos y otros insectos,En temporada de lluvias, el camino puede volverse más resbaladizo; verifica el pronóstico del tiempo antes de tu visita,El acceso puede ser difícil para personas con movilidad reducida debido a las escaleras y el terreno irregular,Si no sabes nadar, es mejor evitar ingresar al agua sin compañía,Confirma los horarios de apertura antes de tu visita, ya que pueden variar,Algunos servicios en la zona pueden no aceptar tarjetas; lleva efectivo para cualquier gasto adicional", // Descripción única
  ),
  RecommendedPlaceModel(
    name: "Catarata Pucayaquillo",
    image: "assets/places/place10.jpeg",
    rating: 4.1,
    location: "Tarapoto",
    estimatedTime: "00d:00h:40m",
    description:
        "Es uno de los atractivos turísticos más visitados de la zona, ya que ofrece un espectáculo natural de gran belleza y una oportunidad para disfrutar de la biodiversidad y la cultura local. El sonido del agua caer era relajante y el paisaje es impresionante, es un destino que no te puedes perder si quieres conocer la belleza y la diversidad de la selva peruana.",
    recommendations:
        "Llevar ropa ligera y fresca para el recorrido,Usar zapatos resistentes para caminar en terrenos irregulares,Aplicar protector solar antes de iniciar la caminata,Portar una toalla si se planea nadar en la poza,Llevar cámara fotográfica para capturar el paisaje,Contratar guía local para explorar de manera segura,Llevar repelente de insectos para evitar molestias,Portar agua y alimentos ligeros para el trayecto,Planificar la visita en temporada seca para mejor acceso,Llevar una bolsa para recoger y transportar la basura generada",
    precautions:
        "No correr cerca de la cascada debido a las rocas resbaladizas,Supervisar a los niños mientras nadan o caminan en el área,Evitar entrar al agua si no se tiene experiencia nadando,No alejarse del grupo si se visita en grupo,Respetar las señales de advertencia en el lugar,No tocar plantas desconocidas que puedan causar irritaciones,Tener cuidado con insectos o animales silvestres en el área,Llevar botiquín básico por si ocurre alguna emergencia,No arrojar basura al agua ni al entorno natural,Mantener el volumen bajo para no perturbar la fauna local", // Descripción única
  ),
];
