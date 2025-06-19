import 'package:mobility/models/itineraire_gare/itineraire_gare.dart';
import 'package:mobility/models/stop/stop.dart';
import 'package:mobility/models/gare/gare.dart';

import '../../models/bus/bus_from_firestore/bus.dart';

class MockData {
  static List<ItineraireGare> itineraireGbaka = [
    //Abobo
    ItineraireGare(commune: "Abobo", type: "Gbaka", source: {
      "name": "Abobo Gare Mairie",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Abobo PK 18",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Gbaka", source: {
      "name": "Abobo Gare Mairie",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Kennedy Marché",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Gbaka", source: {
      "name": "Abobo Gare Mairie",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Kennedy Mosquée Ado",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Gbaka", source: {
      "name": "Abobo Gare Mairie",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Akekoi Village",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Gbaka", source: {
      "name": "Abobo Marché",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Biabou",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Gbaka", source: {
      "name": "Abobo Samaké",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Biabou",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Gbaka", source: {
      "name": "Abobo Gare Mairie",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Adjamé Renault",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Gbaka", source: {
      "name": "Abobo Gare Mairie",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Adjamé Liberté",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Gbaka", source: {
      "name": "Abobo BC",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Adjamé Nouvelle Gare",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Gbaka", source: {
      "name": "Carrefour JAUG",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Adjamé Nouvelle Gare",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Gbaka", source: {
      "name": "Lycée Moderne Abobo",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Adjamé Liberté",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Gbaka", source: {
      "name": "Abobo Gare",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Angré Petro Ivoire",
      "commune": "Cocody",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Gbaka", source: {
      "name": "Abobo Gare",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Belle Ville",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Gbaka", source: {
      "name": "Abobo Gare",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Gare d'Anyama",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Gbaka", source: {
      "name": "Abobo Gare",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Ndotré",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Gbaka", source: {
      "name": "Abobo Gendarmerie",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Carrefour Zone",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Gbaka", source: {
      "name": "Abobo Agripac",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Carrefour Zone",
      "commune": "yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),

    //Adjamé
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Agban",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "BingeVille",
      "commune": "BingerVille",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Agban",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Port-Bouet Vridi",
      "commune": "Port-Bouet",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Agban",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Bouassi",
      "commune": "yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Agban",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Camp Militaire",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Agban",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Gare Gesco",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Gare en Haut",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Akouedo Attié",
      "commune": "Cocody",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Gare en Haut",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "BingerVille",
      "commune": "BingerVille",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Gare en Haut",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Cocody Akouedo",
      "commune": "Cocody",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Gare en Haut",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Cocody Anono",
      "commune": "Cocody",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Gare en Haut",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Cocody Attoban Camp",
      "commune": "Cocody",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Gare en Haut",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Cocody Riviera M'Badon",
      "commune": "Cocody",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Gare en Haut",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Cocody Riviera M'Pouto",
      "commune": "Cocody",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Liberté",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "BingerVille",
      "commune": "BingerVille",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Liberté",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Carrefour Lokoa",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Liberté",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Cocody Riviera 2",
      "commune": "Cocody",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Liberté",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Koumassi",
      "commune": "Koumassi",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Liberté",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "TreichVille Gare de Bassam",
      "commune": "TreichVille",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Liberté",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Palais",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Liberté",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Carrefour Académie",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Liberté",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Niangon Ternminus 27",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Liberté",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Sideci IGES",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Mosquée",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Carrefour Académie",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Mosquée",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Sideci IGES",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Mosquée",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Lokoa",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Mosquée",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Niangon Terminus 27",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Renault",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Palais",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Texaco",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Camp Militaire",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Texaco",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Koweit",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Adjamé Texaco",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Lubafirque",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Gare Kobenan Agban",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "BingerVille",
      "commune": "BingerVille",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Gare Kobenan Agban",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Carrefour Académie",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Gare Kobenan Agban",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Koweit",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Gare Kobenan Agban",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Lubafrique",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Gare Kobenan Agban",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Marché Bagnon",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Gbaka", source: {
      "name": "Gare Kobenan Agban",
      "commune": "Adjamé",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Niangon Terminus 27",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),

//TreichVille

    ItineraireGare(commune: "TreichVille", type: "Gbaka", source: {
      "name": "TreichVille Gare de Bassam",
      "commune": "TreichVille",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Port-Bouet GonzagueVille",
      "commune": "Port-Bouet",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "TreichVille", type: "Gbaka", source: {
      "name": "TreichVille Rue 12",
      "commune": "TreichVille",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Marcory Anoumabo sans fil",
      "commune": "Marcory",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),

    //Port-Bouet
    ItineraireGare(commune: "Port-Bouet", type: "Gbaka", source: {
      "name": "Casier",
      "commune": "Port-Bouet",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "BelleVille",
      "commune": "Port-Bouet",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Port-Bouet", type: "Gbaka", source: {
      "name": "GonzagueVille Corridor",
      "commune": "Port-Bouet",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Abraham",
      "commune": "Port-Bouet",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Port-Bouet", type: "Gbaka", source: {
      "name": "GonzagueVille Corridor",
      "commune": "Port-Bouet",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Eléphant",
      "commune": "Port-Bouet",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Port-Bouet", type: "Gbaka", source: {
      "name": "GonzagueVille Corridor",
      "commune": "Port-Bouet",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Usine",
      "commune": "Port-Bouet",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Port-Bouet", type: "Gbaka", source: {
      "name": "Mobiobi",
      "commune": "Port-Bouet",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Terminus Mobiobi",
      "commune": "Port-Bouet",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),

    //Yopougon
    ItineraireGare(commune: "Yopougon", type: "Gbaka", source: {
      "name": "Yopougon Académie",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Diop",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Gbaka", source: {
      "name": "Yopougon Carrefour CHU",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Sable",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Gbaka", source: {
      "name": "Yopougon Carrefour Zone",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Abobo Agripac",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Gbaka", source: {
      "name": "Yopougon Carrefour Zone",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Ndotré",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Gbaka", source: {
      "name": "Yopougon Koweit",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Zone Industrielle",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Gbaka", source: {
      "name": "Yopougon Locodjro marine",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Attecoubé Garage",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Gbaka", source: {
      "name": "Yopougon Palais",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Beago Wolosso",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Gbaka", source: {
      "name": "Yopougon Sable",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Koweit",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Gbaka", source: {
      "name": "Yopougon Siporex",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Songon Agban",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Gbaka", source: {
      "name": "Yopougon Siporex",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon carrefour Académie",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Gbaka", source: {
      "name": "Yopougon Siporex",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Gesco",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Gbaka", source: {
      "name": "Yopougon Siporex",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Sdeci IGES",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Gbaka", source: {
      "name": "Yopougon Siporex",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Lokoa",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Gbaka", source: {
      "name": "Zone Insdustrielle",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Yopougon Gesco",
      "commune": "Yopougon",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
  ];

  static List<ItineraireGare> itineraireTaxi = [
    //Abobo
    ItineraireGare(commune: "Abobo", type: "Taxi", source: {
      "name": "Abobo Gare",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Angré Petro Ivoire",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Taxi", source: {
      "name": "Abobo Gare",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Biabou",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Taxi", source: {
      "name": "Abobo Gare",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Terminus Derrière Rail",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Taxi", source: {
      "name": "Abobo Gendarmerie",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Houphouet-Boigny",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Taxi", source: {
      "name": "Abobo Gendarmerie",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Ndotré",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Taxi", source: {
      "name": "Abobo Gendarmerie",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Terminus Derrière Rail Celeste",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Taxi", source: {
      "name": "Abobo Marché",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Abobo Baoulé",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Taxi", source: {
      "name": "Abobo Marché",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Carrefour Kennedy",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Taxi", source: {
      "name": "Abobo Marché",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Dokui",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Taxi", source: {
      "name": "Abobo Marché",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Habitat Grace",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Taxi", source: {
      "name": "Abobo Marché",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "houphouet-Boigny",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Taxi", source: {
      "name": "Abobo Marché",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Kennedy",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Taxi", source: {
      "name": "Abobo Samaké",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Abobo Baoulé",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Taxi", source: {
      "name": "Ancienne Gendarmerie",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Grand Carrefour",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Taxi", source: {
      "name": "Gare d'Anyama",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "MAirie d'Anyama",
      "commune": "Anyama",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Abobo", type: "Taxi", source: {
      "name": "Lycée Moderne d'Abobo",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Houphouet-Boigny",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),

    //Adjamé
    ItineraireGare(commune: "Adjamé", type: "Taxi", source: {
      "name": "Adjamé Liberté",
      "commune": "Adjamé",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Adjamé Mairie Dallas",
      "commune": "Adjamé",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Adjamé", type: "Taxi", source: {
      "name": "Adjamé Liberté",
      "commune": "Adjamé",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Saint Michel",
      "commune": "Adjamé",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),

    //Attecoubé
    ItineraireGare(commune: "Attecoubé", type: "Taxi", source: {
      "name": "Mossikro",
      "commune": "Attecoubé",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Abobo Doumé Santé",
      "commune": "Attecoubé",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),

    //Cocody
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "9 Kilo",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Akouedo",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "9 Kilo",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Sol Beni Au Bateau",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Abobo Azur Mobil",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Saint Jean",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Blockauss",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "CHU de Cocody",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Blockauss",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "La Vie",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Carrefour 9 Km",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Palmeraie SIPIM 4 ",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Gare Bonoumin",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Abri 2000",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Gare Carrefour 2 Plateaux",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "vallon",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Palmeraie",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Les Rosiers",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Palmeraie",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Mahou / Azur",
      "commune": "Abobo",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Palmeraie",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Terminus 81-82",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Riviera 2",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Anono",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Riviera 2 Station",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Akouedo",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Riviera 2",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Angré 22ème",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Riviera 2",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Angré Terminus 81-82",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Riviera 2",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Attoban Camp",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Saint Jean",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Angré Château",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Saint Jean",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Blockauss",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Saint Jean",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Riviera 2",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Station Après Barage",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "CHU Angré",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Station Après Barage",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Rosier Programme 6",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Zoo",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Attoban",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Zoo",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Pont Soro",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Zoo",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Vallon",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Cocody", type: "Taxi", source: {
      "name": "Zoo",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Zinsou",
      "commune": "Cocody",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),

    //Koumassi
    ItineraireGare(commune: "Koumassi", type: "Taxi", source: {
      "name": "Anoumabo San Fil",
      "commune": "Koumassi",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Koumassi Hôpital Général",
      "commune": "Koumassi",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Koumassi", type: "Taxi", source: {
      "name": "Anoumabo San Fil",
      "commune": "Koumassi",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Sicogi",
      "commune": "Koumassi",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Koumassi", type: "Taxi", source: {
      "name": "Gare Comunale",
      "commune": "Koumassi",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Sicogi",
      "commune": "Koumassi",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Koumassi", type: "Taxi", source: {
      "name": "Gare Comunale",
      "commune": "Koumassi",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Soweto",
      "commune": "Koumassi",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Koumassi", type: "Taxi", source: {
      "name": "Koumassi Grand Marché ",
      "commune": "Koumassi",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Ancien Koumassi",
      "commune": "Koumassi",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Koumassi", type: "Taxi", source: {
      "name": "Koumassi Grand Marché ",
      "commune": "Koumassi",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Soweto",
      "commune": "Koumassi",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Koumassi", type: "Taxi", source: {
      "name": "Koumassi Grand Marché ",
      "commune": "Koumassi",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Terminus 05",
      "commune": "Koumassi",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Koumassi", type: "Taxi", source: {
      "name": "Sicogi",
      "commune": "Koumassi",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Soweto",
      "commune": "Koumassi",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Koumassi", type: "Taxi", source: {
      "name": "Sicogi",
      "commune": "Koumassi",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Terminus 32",
      "commune": "Koumassi",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),

    //Marcory

    ItineraireGare(commune: "Marcory", type: "Taxi", source: {
      "name": "Carrefour Lycée",
      "commune": "Marcory",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "CTAO",
      "commune": "Marcory",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Marcory", type: "Taxi", source: {
      "name": "Carrefour Lycée",
      "commune": "Marcory",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Maison Blanche",
      "commune": "Marcory",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Marcory", type: "Taxi", source: {
      "name": "Gare Sotra Marcory",
      "commune": "Marcory",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "CTAO",
      "commune": "Marcory",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Marcory", type: "Taxi", source: {
      "name": "Gare Sotra Marcory",
      "commune": "Marcory",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Maison Blanche",
      "commune": "Marcory",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Marcory", type: "Taxi", source: {
      "name": "Hibiscus",
      "commune": "Marcory",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Mairie de Marcory",
      "commune": "Marcory",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),

    //Port-Bouet
    ItineraireGare(commune: "Port-Bouet", type: "Taxi", source: {
      "name": "Carrefour Aéroport",
      "commune": "Port-Bouet",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Aéroport",
      "commune": "Port-Bouet",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Port-Bouet", type: "Taxi", source: {
      "name": "Marché de Port-Bouet",
      "commune": "Port-Bouet",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Anani",
      "commune": "Port-Bouet",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Port-Bouet", type: "Taxi", source: {
      "name": "Marché de Port-Bouet",
      "commune": "Port-Bouet",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Port de pêche",
      "commune": "Port-Bouet",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Port-Bouet", type: "Taxi", source: {
      "name": "Marché de Port-Bouet",
      "commune": "Port-Bouet",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Vridi Canal",
      "commune": "Port-Bouet",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Port-Bouet", type: "Taxi", source: {
      "name": "Marché de Port-Bouet",
      "commune": "Port-Bouet",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Vridi Cité",
      "commune": "Port-Bouet",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Port-Bouet", type: "Taxi", source: {
      "name": "Terre Rouge",
      "commune": "Port-Bouet",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Bonogosso",
      "commune": "Port-Bouet",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Port-Bouet", type: "Taxi", source: {
      "name": "Terre Rouge",
      "commune": "Port-Bouet",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Carrefour Deux Poteaux",
      "commune": "Port-Bouet",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),

    //TreichVille
    ItineraireGare(commune: "TreichVille", type: "Taxi", source: {
      "name": "TreichVille Gare de Bassam",
      "commune": "TreichVille",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "TreichVille Gare Bateau-Bus",
      "commune": "TreichVille",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),

    //Yopougon
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Abobo Doumé",
      "commune": "Attecoubé",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Toit Rouge Jean-Paul 2",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Bel Air",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Gabriel Gare",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Bel Air",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Millionnaire Antenne",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Bel Air",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Mossikro",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "BHCI",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Complexe",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "BHCI",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Sapeur Pompier",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "BHCI",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Toit Rouge Jean-Paul 2",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Camp Militaire",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Abobo Doumé",
      "commune": "Attecoubé",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Camp Militaire",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Koweit",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Camp Militaire",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Saguidiba",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Carrefour Zone",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Micao",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Carrefour Zone",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Zone Industrielle",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Complexe",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Koweit",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Coopec Ananeraie",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Carrefour Oasis",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Gabriel Gare",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Mossikro",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Gabriel Gare",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Prison Civile",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Keneya",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Coopec Ananeraie",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Koweit",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Abobo Doumé",
      "commune": "Attecoubé",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Koweit",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Sable",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Koweit",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Toit Rouge Jean-Paul 2",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Yopougon Mairie",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Gabriel Gare",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Palais",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Abobo Doumé",
      "commune": "Attecoubé",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Palais",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Camp Militaire",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Palais",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Koweit",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
    ItineraireGare(commune: "Yopougon", type: "Taxi", source: {
      "name": "Palais",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    }, destination: {
      "name": "Toit Rouge Jean-Paul 2",
      "commune": "Yopougon",
      "type": "Taxi",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    }),
  ];
  //Gares des Gbakas
  static List<Gare> garesGbaka = [
    // Abobo
    Gare(name: "Abobo Gare Mairie", commune: "Abobo", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(
      name: "Abobo PK 18",
      commune: "Abobo",
      type: "Gbaka",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(name: "Kennedy Marché", commune: "Abobo", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(
        name: "Kennedy Mosquée Ado",
        commune: "Abobo",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(name: "Akekoi Village", commune: "Abobo", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(name: "Abobo Marché ", commune: "Abobo", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(name: "Biabou", commune: "Abobo", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(
      name: "Abobo Samaké ",
      commune: "Abobo",
      type: "Gbaka",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Abobo BC",
      commune: "Abobo",
      type: "Gbaka",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Carrefour JAUG",
      commune: "Abobo",
      type: "Gbaka",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
        name: "Lycée Moderne Abobo",
        commune: "Abobo",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(name: "Abobo Gare", commune: "Abobo", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(name: "belle Ville", commune: "Abobo", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(name: "Abobo Gendarmerie", commune: "Abobo", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(name: "Abobo Agripac", commune: "Abobo", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(name: "N’dotre", commune: "Abobo", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),

    //Bingerville
    Gare(name: "Bingerville", commune: "Bingerville", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),

    //Cocody
    Gare(
        name: "Angré Petro Ivoire",
        commune: "Cocody",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(name: "Akouedo Attié", commune: "Cocody", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(name: "Cocody Anono", commune: "Cocody", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(
        name: "Cocody Attoban Camp",
        commune: "Cocody",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(
        name: "Cocody Riviera M’badon",
        commune: "Cocody",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(
        name: "Cocody Riviera M’pouto",
        commune: "Cocody",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(name: "Cocody Riviera 2", commune: "Cocody", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),

    //Adjamé
    Gare(name: "Adjamé Agban", commune: "Adjamé", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(
        name: "Adjamé Gare en Haut",
        commune: "Adjamé",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(name: "Adjamé Liberté", commune: "Adjamé", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(name: "Adjamé Mosquée", commune: "Adjamé", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(
        name: "Adjamé Nouvelle Gare",
        commune: "Adjamé",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(name: "Adjamé Renault", commune: "Adjamé", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(name: "Adjamé Texaco", commune: "Adjamé", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(
        name: "Gare Kobenan Agban",
        commune: "Adjamé",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),

    //Treichville
    Gare(
        name: "Treichville Gare de Bassam",
        commune: "Treichville",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(
        name: "Treichville Rue 12",
        commune: "Treichville",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),

    //Port-Bouet
    Gare(name: "Casier", commune: "Port-Bouet", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(name: "Belleville", commune: "Port-Bouet", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(
        name: "Gonzaqueville Corridor",
        commune: "Port-Bouet",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(name: "Abraham", commune: "Port-Bouet", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(name: "Eléphant", commune: "Port-Bouet", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(name: "Usine", commune: "Port-Bouet", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(name: "Mobiobi", commune: "Port-Bouet", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(
        name: "Terminus Mobiobi",
        commune: "Port-Bouet",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),

    //Yopougon
    Gare(
        name: "Yopougon Académie",
        commune: "Yopougon",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(name: "Yopougon Diop", commune: "Yopougon", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(
        name: "Yopougon Carrefour CHU",
        commune: "Yopougon",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(name: "Yopougon Sable", commune: "Yopougon", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(
        name: "Yopougon Carrefour Zone",
        commune: "Yopougon",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(
        name: "Yopougon Koweit",
        commune: "Yopougon",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(
        name: "Yopougon Zone Industrielle",
        commune: "Yopougon",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(
        name: "Yopougon Locodjro Marine",
        commune: "Yopougon",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(
        name: "Attecoubé Garage",
        commune: "Yopougon",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(
        name: "Yopougon Palais",
        commune: "Yopougon",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(name: "Beago Wolosso", commune: "Yopougon", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(
        name: "Yopougon Siporex",
        commune: "Yopougon",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(name: "Songon Agban", commune: "Yopougon", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(name: "Yopougon Gesco", commune: "Yopougon", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(name: "Yopougon IGES", commune: "Yopougon", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(name: "Yopougon Lokoa", commune: "Yopougon", type: "Gbaka", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(
        name: "Yopougon Lubafrique",
        commune: "Yopougon",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(
        name: "Yopougon Marché Bagnon",
        commune: "Yopougon",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(
        name: "Yopougon Niangon Terminus 27",
        commune: "Yopougon",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(
        name: "Yopougon Camp Militaire",
        commune: "Yopougon",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(
        name: "Yopougon Palais",
        commune: "Yopougon",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(
        name: "Yopougon Sideci IGES",
        commune: "Yopougon",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
    Gare(
        name: "Yopougon Boassi",
        commune: "Yopougon",
        type: "Gbaka",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
  ];

// //Gares de Taxi Communaux
  static List<Gare> garesTaxi = [
    //Abobo
    Gare(name: "Abobo Gare", commune: "Abobo", type: "Taxi", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(
      name: "Biabou",
      commune: "Abobo",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Terminus Derrière Rail",
      commune: "Abobo",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Abobo Gendarmerie",
      commune: "Abobo",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Houphouet-Boigny",
      commune: "Abobo",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Terminus Derrière Rail Céleste",
      commune: "Abobo",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Abobo Marché",
      commune: "Abobo",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Abobo Baoulé",
      commune: "Abobo",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(name: "Carrefour Kennedy", commune: "Abobo", type: "Taxi", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(
      name: "Dokui",
      commune: "Abobo",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Habitat Grace",
      commune: "Abobo",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Abobo Samaké",
      commune: "Abobo",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Ancienne Gendarmerie",
      commune: "Abobo",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Grand Carrefour",
      commune: "Abobo",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Gare d’Anyama",
      commune: "Abobo",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Mairie d’Anyama",
      commune: "Abobo",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Lycée Moderne d’Abobo",
      commune: "Abobo",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Abobo Azur Mobile",
      commune: "Abobo",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Mahou / Azur",
      commune: "Abobo",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),

    //Adjamé
    Gare(
      name: "Adjamé Liberté",
      commune: "Adjamé",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Adjamé Mairie Dallas",
      commune: "Adjamé",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Saint Michel",
      commune: "Adjamé",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),

    //Attecoubé
    Gare(
      name: "Mossikro",
      commune: "Attecoubé",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Abobo Doumé Santé",
      commune: "Attecoubé",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Abobo Doumé Gare Bateau-bus",
      commune: "Attecoubé",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),

    //Cocody
    Gare(
      name: "9 Kilo",
      commune: "Cocody",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Akouédo",
      commune: "Cocody",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Sol Beni au Bateau",
      commune: "Cocody",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Saint Jean",
      commune: "Cocody",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Blockauss",
      commune: "Cocody",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "La Vie",
      commune: "Cocody",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Carrefour 9Km",
      commune: "Cocody",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Palmeraie SIPIM 4",
      commune: "Cocody",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Gare Bonoumin",
      commune: "Cocody",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Abri 2000",
      commune: "Cocody",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Gare Carrefour 2 Plateaux",
      commune: "Cocody",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Vallon",
      commune: "Cocody",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Palmeraie",
      commune: "Cocody",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Les Rosiers",
      commune: "Cocody",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Terminus 81-82",
      commune: "Cocody",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Riviera 2",
      commune: "Cocody",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Anono",
      type: "Taxi",
      commune: "Cocody",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Riviera 2 Station",
      type: "Taxi",
      commune: "Cocody",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Angré 22ème",
      type: "Taxi",
      commune: "Cocody",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Attoban Camp",
      commune: "Cocody",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Angré Château",
      type: "Taxi",
      commune: "Cocody",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Station après Barrage",
      commune: "Cocody",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "CHU Angré",
      commune: "Cocody",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Rosier Programme 6",
      commune: "Cocody",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Zoo",
      type: "Taxi",
      commune: "Cocody",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Pont Soro",
      type: "Taxi",
      commune: "Cocody",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Zinsou",
      type: "Taxi",
      commune: "Cocody",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),

    //Koumassi
    Gare(
      name: "Anoumabo sans fil",
      commune: "Koumassi",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Koumassi Hôpital général",
      commune: "Koumassi",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Sicogi",
      commune: "Koumassi",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Gare Communale",
      commune: "Koumassi",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Soweto",
      commune: "Koumassi",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Koumassi Grand Marché",
      commune: "Koumassi",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Ancien Koumassi",
      commune: "Koumassi",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Terminus 05",
      commune: "Koumassi",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Terminus 32",
      commune: "Koumassi",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),

    //Marcory
    Gare(
      name: "Carrefour Lycée",
      commune: "Marcory",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "CTAO",
      type: "Taxi",
      commune: "Marcory",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Mairie de Marcory",
      commune: "Marcory",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(name: "Hibiscus", commune: "Marcory", type: "Taxi", location: {
      "label": "teste",
      "lat": 5.3502292,
      "long": -3.9881887,
    }),
    Gare(
      name: "Gare Sotra Marcory",
      commune: "Marcory",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),

    //Port-Bouet
    Gare(
      name: "Carrefour Aéroport",
      commune: "Port-Bouet",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Anani",
      commune: "Port-Bouet",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Aéroport",
      type: "Taxi",
      commune: "Port-Bouet",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Vridi Cité",
      type: "Taxi",
      commune: "Port-Bouet",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Vridi Canal",
      type: "Taxi",
      commune: "Port-Bouet",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Port de Pêche",
      commune: "Port-Bouet",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Marché de Port-Bouet",
      commune: "Port-Bouet",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Terre Rouge",
      commune: "Port-Bouet",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Benogosso",
      commune: "Port-Bouet",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Carrefour Deux Poteaux",
      commune: "Port-Bouet",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),

    //Treichville
    Gare(
      name: "Treichville Gare Bassam",
      commune: "Treichville",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Treichville Gare Bateau-bus",
      commune: "Treichville",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),

    // Yopougon
    Gare(
      name: "Toit Rouge Jean-Paul 2",
      commune: "Yopougon",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Bel Air",
      commune: "Yopougon",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Gabriel Gare",
      commune: "Yopougon",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Mossikro",
      type: "Taxi",
      commune: "Yopougon",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "BHCI",
      type: "Taxi",
      commune: "Yopougon",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Micao",
      commune: "Yopougon",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Sable",
      type: "Taxi",
      commune: "Yopougon",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Mairie",
      type: "Taxi",
      commune: "Yopougon",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Kenya",
      commune: "Yopougon",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Palais",
      commune: "Yopougon",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Prison Civile",
      commune: "Yopougon",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Carrefour Oasis",
      commune: "Yopougon",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Coopec Ananeraie",
      commune: "Yopougon",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Zone Industrielle",
      commune: "Yopougon",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Camp Militaire",
      commune: "Yopougon",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Koweit",
      commune: "Yopougon",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Saguidiba",
      type: "Taxi",
      commune: "Yopougon",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Carrefour Zone",
      type: "Taxi",
      commune: "Yopougon",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
      name: "Sapeur-Pompier",
      commune: "Yopougon",
      type: "Taxi",
      location: {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    ),
    Gare(
        name: "Millionnaire Antenne",
        commune: "Yopougon",
        type: "Taxi",
        location: {
          "label": "teste",
          "lat": 5.3502292,
          "long": -3.9881887,
        }),
  ];

//Données sur les bus
  static List<Stop> stop = [
    Stop(
      lat: 5.3502292,
      long: -3.9881887,
    ),
    Stop(
      lat: 5.350667,
      long: -3.988207,
    ),
    Stop(
      lat: 5.351888,
      long: -3.983774,
    ),
    Stop(
      lat: 5.353108,
      long: -3.979858,
    ),
    Stop(
      lat: 5.353845,
      long: -3.977656,
    ),
    Stop(
      lat: 5.354784,
      long: -3.974198,
    ),
    Stop(
      lat: 5.356915,
      long: -3.967548,
    ),
    Stop(
      lat: 5.358065,
      long: -3.964597,
    ),
    Stop(
      lat: 5.360552,
      long: -3.965393,
    ),
    Stop(
      lat: 5.362438,
      long: -3.966146,
    ),
    Stop(
      lat: 5.362040,
      long: -3.967070,
    ),
  ];

  static List<Bus> dataBus = [
    Bus(
        number: 610,
        source: "Adjamé",
        destination: "BingerVille",
        roadMap: [],
        isActive: true),
    Bus(
        number: 610,
        source: "Ecole de Police",
        destination: "Chu TreichVille",
        roadMap: [],
        isActive: false),
    Bus(
        number: 21,
        source: "Abobo Sogefia",
        destination: "Gare Sud",
        roadMap: [],
        isActive: true),
    Bus(
        number: 21,
        source: "Gare Campus",
        destination: "Yopougon Kouté",
        roadMap: [],
        isActive: false),
    Bus(
        number: 15,
        source: "Abobo Sogefia",
        destination: "Gare Campus",
        roadMap: [],
        isActive: true),
    Bus(
        number: 15,
        source: "Abobo Sogefia",
        destination: "Gare Campus",
        roadMap: [],
        isActive: false),
    Bus(
        number: 85,
        source: "Yopougon Kouté",
        destination: "Gare Campus",
        roadMap: [],
        isActive: true),
    Bus(
        number: 85,
        source: "Gare Campus",
        destination: "Yopougon Kouté",
        roadMap: [],
        isActive: false),
  ];
}
