import '../models/chapter.dart';

const chapters = [
  Chapter(
    title: 'Fundamentos de Produção',
    subtitle: 'Pressão, vazão e balanço de energia',
    code: 'CAP-01',
    topics: [
      'Gradiente de pressão',
      'Vazão crítica',
      'Perda de carga em linhas',
      'Eficiência de elevação',
    ],
  ),
  Chapter(
    title: 'Perfuração e Completação',
    subtitle: 'Fluidos, colunas e integridade',
    code: 'CAP-02',
    topics: [
      'Densidade de lama',
      'Pressão hidrostática',
      'Taxa de penetração',
      'Janela operacional',
    ],
  ),
  Chapter(
    title: 'Escoamento e Transporte',
    subtitle: 'Modelos e análise de dutos',
    code: 'CAP-03',
    topics: [
      'Regimes multifásicos',
      'Fator de atrito',
      'Curvas de desempenho',
      'Controle de corrosão',
    ],
  ),
  Chapter(
    title: 'Reservatórios',
    subtitle: 'Propriedades e desempenho',
    code: 'CAP-04',
    topics: [
      'Equações de Darcy',
      'Índice de produtividade',
      'Compressibilidade',
      'Declínio de produção',
    ],
  ),
];
