typedef Strategy = double Function(List<String> cardOnDesk, List<String> currentHand);

final Strategy printOpponentCardsStrategy = (cardOnDesk, currentHand) {
  final opponentCards = ['Ten of spades', 'Queen of hearts'];
  print('Opponent cards: $opponentCards');
  return 0.5;
};

class PokerPlayer {
  List<String> _currentHand = ['King of clubs', 'Nine of hearts'];
  double _surenessInWin = 0;

  void calculateProbabilities(
      List<String> cardOnDesk,
      Strategy strategy,
      ) =>
      _surenessInWin = strategy(cardOnDesk, _currentHand);
}

void main() {
  final opponent = PokerPlayer();

  final Strategy fakeStrategy = (cardOnDesk, currentHand) {
    final opponentCards = ['Nine of diamonds', 'King of hearts'];
    final matchingCards = opponentCards.where((card) => currentHand.contains(card)).toList();
    print('Opponent cards: $opponentCards');
    return 0.3;
  };

  opponent.calculateProbabilities(
    ['Nine of diamonds', 'King of hearts'],
    fakeStrategy,
  );
}