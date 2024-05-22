  import 'package:flutter/material.dart';
  import 'package:flutter_test/flutter_test.dart';
  import 'package:shared_preferences/shared_preferences.dart';
  import 'package:Mobile/views/RealizarAvaliacoesPageView.dart';
  import 'package:http/http.dart' as http;
  import 'package:http/testing.dart';
  import 'dart:convert';

  void main() {
    testWidgets('Test data submission', (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({
        'nomePesquisado': 'John Doe',
        'cargoPesquisado': 'Developer',
        'idPesquisado': '123',
      });

      // Mock HTTP client
      final client = MockClient((request) async {
        expect(request.url, Uri.parse('https://projeto-sementes.onrender.com/avaliacoes/criar'));
        expect(request.headers['Content-Type'], 'application/json');
        final body = json.decode(request.body);
        expect(body['usuarioAvaliadoId'], '123');
        expect(body['comunicacao'], 0); // Default value when no checkbox is selected
        return http.Response('{"message": "success"}', 201);
      });

      await tester.pumpWidget(MaterialApp(home: RealizarAvaliacoesPageView(httpClient: client)));

      // Enter text in the text field
      await tester.enterText(find.byType(TextField), 'Great performance!');
      await tester.pump();

      // Tap the submit button
      await tester.tap(find.text('Enviar Avaliação'));
      await tester.pump();

      // Verify if the submission was successful
      expect(find.text('Avaliação enviada com sucesso'), findsOneWidget);
    });
  }
