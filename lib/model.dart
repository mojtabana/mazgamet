class Box {
  const Box({
    required this.situation,
    this.id = 0,
    });

  final Situation situation;
  final int id;
  
  

  Box copyWith({int? id, Situation? situation}) {
    return Box(
      id: id ?? this.id,
      situation: situation ?? this.situation,
    );
  }
}


enum Situation {
  s1,
  s2,
  s3,
}