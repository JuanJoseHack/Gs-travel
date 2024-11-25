class NearbyPlaceModel {
  final String image;
  final String name;
  final double rating; // Nombre del lugar
  final String location; // Ubicación del lugar
  final String estimatedTime; // Tiempo estimado para llegar
  final String description;
  final String recommendations; // Recomendaciones
  final String precautions; // Precauciones
  // Descripción del lugar

  NearbyPlaceModel({
    required this.image,
    required this.name,
    required this.rating,
    required this.location,
    required this.estimatedTime,
    required this.description,
    required this.recommendations,
    required this.precautions,
  });
}

List<NearbyPlaceModel> nearbyPlaces = [
  NearbyPlaceModel(
    name: "Laguna Ricuricocha",
    image: "assets/places/place2.jpg",
    rating: 4.4,
    location: "Cumbaza",
    estimatedTime: "00d:00h:20m",
    description:
        "La Laguna Ricuricocha, es considerada un punto de interés de avistamiento aves, el cual se encuentra incluida en la Ruta de Aves del Norte del Perú. Destaca también por su gran variedad de especies ictiológica, entre los más resaltantes: el Fasaco, Paña y la Tilapia; moluscos como, conchas y choros; convirtiéndose en un lugar propicio para la pesca deportiva, además se puede disfrutar de un baño, nadar alrededor de sus orillas y paseos en canoa.",
    recommendations:
        "Llevar ropa ligera y cómoda para el clima cálido,Usar protector solar para protegerse de la exposición al sol,Portar repelente de insectos para evitar picaduras,Llevar traje de baño si planeas nadar en la laguna,Portar cámara fotográfica para capturar la belleza del lugar,Llevar alimentos y bebidas ligeras, como agua potable,Contratar un guía local para aprender sobre la biodiversidad del área,Llevar bolsas para recoger y transportar la basura generada,Llevar sombrero o gorra para mayor protección contra el sol,Planificar la visita temprano para disfrutar del paisaje con menos visitantes",
    precautions:
        "Evitar nadar en áreas profundas o no señalizadas,Supervisar a los niños en todo momento cerca del agua,No caminar fuera de los senderos marcados para evitar extravíos,No tocar ni dañar la flora y fauna local,Tener cuidado con rocas resbaladizas en las orillas,No dejar basura en el lugar para preservar el ecosistema,Tener cuidado con insectos o animales silvestres,Llevar calzado adecuado para caminar en terrenos húmedos o resbaladizos,Respetar las normas locales para el uso de la laguna,Evitar realizar actividades ruidosas que puedan alterar la tranquilidad del lugar y la fauna local",
  ),
  NearbyPlaceModel(
    name: "Baños Termales de San Mateo",
    image: "assets/places/place3.jpg",
    rating: 4.7,
    location: "Moyobamba",
    estimatedTime: "00d:2h:15m",
    description:
        "Este complejo recreacional cuenta con seis pozas de aguas termales, cada una con temperaturas que oscilan entre 36°C y 43°C, nombradas en honor a orquídeas locales. Además, ofrece piscinas para adultos y niños, chorros de agua caliente y fría, juegos recreativos, cancha deportiva, zona de masoterapia y restaurante. Las aguas termales son reconocidas por sus propiedades medicinales y terapéuticas, especialmente beneficiosas para la artritis, reumatismo, estrés y dolores musculares.",
    recommendations:
        "Llevar ropa de baño y toalla: Para disfrutar cómodamente de las pozas y piscinas,Usar sandalias antideslizantes: El suelo puede estar resbaladizo debido a la humedad,Aplicar protector solar: Aunque el área está rodeada de vegetación, es recomendable protegerse del sol,Mantenerse hidratado Llevar agua potable para consumir durante la visita,Visitar en horas tempranas Para evitar aglomeraciones y disfrutar de un ambiente más tranquilo,Respetar las indicaciones del personal Para garantizar una experiencia segura y agradable,Llevar efectivo Algunos servicios adicionales pueden requerir pago en efectivo,Consultar sobre servicios de masoterapia Si se desea aprovechar terapias adicionales,Disfrutar de la gastronomía local El restaurante ofrece platos típicos de la región,Respetar el entorno natural No arrojar basura y cuidar las instalaciones",
    precautions:
        "Evitar largas exposiciones al agua caliente Especialmente si se tienen condiciones de salud como hipertensión,Supervisar a los niños en todo momento Para prevenir accidentes en las pozas y piscinas,No consumir alcohol antes de ingresar a las pozas Para evitar deshidratación o mareos,Tener cuidado al caminar en áreas húmedas Para prevenir resbalones,No ingresar al agua con heridas abiertas: Para evitar infecciones,Consultar con un médico si se tienen condiciones de salud preexistentes Antes de usar las aguas termales,No correr en las instalaciones: Para evitar caídas,Respetar los tiempos de uso recomendados en las pozas Para evitar sobrecalentamiento corporal,No ingerir alimentos dentro de las pozas o piscinas Para mantener la limpieza del agua,Estar atento a las indicaciones sobre la temperatura del agua: Para evitar quemaduras",
  ),
  NearbyPlaceModel(
    name: "Centro Urku",
    image: "assets/places/place9.jpg",
    rating: 4.9,
    location: "Tarapoto",
    estimatedTime: "00d:0h:15m",
    description:
        "Este centro es un espacio dedicado a la preservación y rehabilitación de fauna silvestre amazónica. Urku trabaja en la conservación de especies nativas de la región, combinando educación ambiental y actividades interactivas para visitantes. Es ideal para familias, estudiantes y amantes de la naturaleza.",
    recommendations:
        "Llevar cámara fotográfica para capturar imágenes de los animales y el entorno,Usar ropa cómoda y fresca para caminar en el lugar,Aplicar repelente de insectos antes de la visita,Participar en las actividades educativas ofrecidas por el centro,Llevar agua potable para mantenerse hidratado,Comprar productos locales en las tiendas asociadas al centro para apoyar su labor,Planificar la visita temprano para disfrutar del día completo,Informarse sobre las especies protegidas y su historia,Respetar las normas del centro para garantizar la seguridad de los animales,Llevar sombrero o gorra para protegerse del sol",
    precautions:
        "No alimentar a los animales sin autorización,No tocar o interactuar directamente con los animales,Supervisar a los niños en todo momento,Respetar las áreas restringidas y las señales de advertencia,No arrojar basura dentro del centro,Tener cuidado al caminar en senderos para evitar tropiezos o resbalones,Evitar ruidos fuertes que puedan perturbar a los animales,No consumir alimentos ni bebidas en las áreas de observación,Mantener la distancia recomendada con los animales,Consultar con el personal si tienes preguntas o dudas durante la visita",
  ),
  NearbyPlaceModel(
    name: "Jardín Botánico de Orquídeas",
    image: "assets/places/place4.jpg",
    rating: 4.2,
    location: "Moyobamba",
    estimatedTime: "00d:2h:10m",
    description:
        "Este jardín botánico es un centro de estudios e investigaciones científicas dedicado a la conservación de la flora nativa y exótica del valle del Alto Mayo. Alberga una impresionante colección de orquídeas, plantas medicinales como la sangre de grado y la uña de gato, árboles frutales y diversas flores como el pico de loro y heliconias.",
    recommendations:
        "Llevar cámara fotográfica: Para capturar la diversidad de especies vegetales,Usar ropa cómoda y fresca: Adecuada para caminar por el jardín,Aplicar repelente de insectos: Para evitar picaduras durante el recorrido,Llevar agua potable: Para mantenerse hidratado durante la visita,Visitar en horas de la mañana: Cuando las flores están más abiertas y el clima es más fresco,Respetar las indicaciones del personal: Para una experiencia educativa y segura,No tocar las plantas sin autorización: Para preservar su estado y evitar daños,Participar en visitas guiadas: Para obtener información detallada sobre las especies,Llevar sombrero o gorra: Para protección adicional contra el sol,Adquirir recuerdos en la tienda del jardín: Para apoyar la conservación y llevar un recuerdo de la visita",
    precautions:
        "No arrancar flores o plantas: Para conservar la biodiversidad del jardín,Supervisar a los niños en todo momento: Para evitar que toquen plantas delicadas o peligrosas,No consumir alimentos dentro del jardín: Para mantener la limpieza y evitar atraer insectos,Tener cuidado al caminar por senderos húmedos o resbaladizos: Para prevenir caídas,No ingresar a áreas restringidas: Para proteger especies en conservación,Evitar el uso de flash al fotografiar: Para no dañar las plantas sensibles,No fumar dentro del jardín: Para prevenir incendios y proteger las plantas",
  ),
  NearbyPlaceModel(
    name: "Mirador TAYTAMAKI",
    image: "assets/places/place5.jpg",
    rating: 4.4,
    location: "Tarapoto",
    estimatedTime: "00d:0h:20m",
    description:
        "El Mirador TAYTAMAKI es un lugar icónico para apreciar vistas impresionantes de la ciudad de Tarapoto, los valles y la vegetación amazónica. Es un destino ideal para amantes de la fotografía, parejas que buscan un lugar romántico o cualquier visitante que quiera relajarse mientras disfruta de la naturaleza.",
    recommendations:
        "Llevar cámara fotográfica para capturar las vistas panorámicas,Usar ropa cómoda y fresca, adecuada para caminar y el clima cálido,Portar protector solar para evitar quemaduras debido a la exposición prolongada al sol,Llevar repelente de insectos, especialmente en horas de la tarde,Visitar en horas de la tarde para disfrutar de la puesta de sol,Llevar agua potable para mantenerse hidratado durante la visita,Planificar la visita en días despejados para una mejor visibilidad,Usar calzado antideslizante para mayor seguridad en las áreas elevadas,Llevar una gorra o sombrero para protegerse del sol,Disfrutar de las áreas de descanso y relajarse en el entorno natural",
    precautions:
        "Tener cuidado al caminar cerca de áreas elevadas para evitar accidentes,Supervisar a los niños en todo momento, especialmente cerca de barandas o bordesNo arrojar basura para preservar la limpieza del lugar,Evitar acercarse a áreas no señalizadas o restringidas,Respetar las normas del mirador y del personal que lo administra,Llevar una linterna si se planea permanecer hasta después del atardecer,No realizar actividades ruidosas que puedan alterar la tranquilidad del lugar,Tener cuidado con insectos o animales que puedan encontrarse en la zona,Usar repelente adicional si se planea quedarse al anochecer,No consumir alcohol antes o durante la visita para evitar riesgos innecesarios",
  ),
];
