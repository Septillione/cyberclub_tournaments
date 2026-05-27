// tournament_bloc_test.dart

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// --- НАЧАЛО: Эти классы нужно будет адаптировать под ваши ---

// 1. Заглушки для ваших классов
class MockTournamentRepository extends Mock implements TournamentRepository {}

class MockTournament extends Mock implements TournamentEntity {}

// 2. Ваши реальные классы (или их заглушки)
// Если у вас нет реальных классов, просто создайте такие же пустые
class TournamentRepository {
  Future<List<TournamentEntity>> getTournaments() async => [];
}

class TournamentEntity {}

// События
class LoadTournamentsEvent {}

// Состояния
class TournamentState {}

class TournamentLoadingState extends TournamentState {}

class TournamentLoadedState extends TournamentState {
  final List<TournamentEntity> tournaments;
  TournamentLoadedState(this.tournaments);
}

class TournamentErrorState extends TournamentState {}

// Сам BLoC
class TournamentBloc extends Bloc<LoadTournamentsEvent, TournamentState> {
  final TournamentRepository repository;

  TournamentBloc(this.repository) : super(TournamentLoadingState()) {
    on<LoadTournamentsEvent>((event, emit) async {
      emit(TournamentLoadingState());
      try {
        final tournaments = await repository.getTournaments();
        emit(TournamentLoadedState(tournaments));
      } catch (e) {
        emit(TournamentErrorState());
      }
    });
  }
}
// --- КОНЕЦ: Адаптация ---

void main() {
  // Объявляем переменные для теста
  late TournamentBloc tournamentBloc;
  late MockTournamentRepository mockTournamentRepository;

  // Метод setUp вызывается перед каждым тестом
  setUp(() {
    mockTournamentRepository = MockTournamentRepository();
    tournamentBloc = TournamentBloc(mockTournamentRepository);
  });

  group('TournamentBloc', () {
    // Тест 1
    test('initial state is TournamentLoadingState', () {
      expect(tournamentBloc.state, isA<TournamentLoadingState>());
    });

    // Тест 2
    blocTest<TournamentBloc, TournamentState>(
      'emits [TournamentLoadingState, TournamentLoadedState] when LoadTournamentsEvent is added and succeeds.',
      build: () {
        when(
          () => mockTournamentRepository.getTournaments(),
        ).thenAnswer((_) async => []);
        return tournamentBloc;
      },
      act: (bloc) => bloc.add(LoadTournamentsEvent()),
      expect: () => [
        isA<TournamentLoadingState>(),
        isA<TournamentLoadedState>(),
      ],
    );

    // Тест 3
    blocTest<TournamentBloc, TournamentState>(
      'emits [TournamentLoadingState, TournamentErrorState] when LoadTournamentsEvent is added and fails.',
      build: () {
        when(
          () => mockTournamentRepository.getTournaments(),
        ).thenThrow(Exception('Failed to load'));
        return tournamentBloc;
      },
      act: (bloc) => bloc.add(LoadTournamentsEvent()),
      expect: () => [
        isA<TournamentLoadingState>(),
        isA<TournamentErrorState>(),
      ],
    );
  });
}
