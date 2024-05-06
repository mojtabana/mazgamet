
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mazgamet/model.dart';

class BoxNotifier extends Notifier<List<Box>>{
  @override
  build() {
    return [
      const Box(id: 0, situation: Situation.s1),
      const Box(id: 1, situation: Situation.s2),
      const Box(id:2, situation: Situation.s3),
    ];
  }

  void update(int id, Situation situation){
    state = [
      for(final box in state)
        if(box.id == id)
          box.copyWith(id: id,situation: situation)
        else
          box,
    ];
  }
  
}

final boxProvider = NotifierProvider<BoxNotifier, List<Box>>(() {
  return BoxNotifier();
});



