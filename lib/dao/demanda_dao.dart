// Importação do modelo de tarefa, que define como as tarefas serão representadas
import 'package:trab_dispositivos_moveis/model/demanda_model.dart';
// Importação do pacote sqflite para manipulação de banco de dados SQLite
import 'package:sqflite/sqflite.dart';
// Importação do pacote path para trabalhar com caminhos de arquivos
import 'package:path/path.dart';

// Definição da classe DemandaDao, que é responsável por acessar e manipular o banco de dados das tarefas
class DemandaDao {
  // Singleton da classe DemandaDao, garantindo que apenas uma instância exista
  static final DemandaDao instance = DemandaDao._init();

  // Variável que armazenará a instância do banco de dados SQLite
  static Database? _database;

  // Construtor privado da classe (padrão singleton)
  DemandaDao._init();

  // Getter que retorna a instância do banco de dados, ou a inicializa caso ainda não esteja criado
  Future<Database> get database async {
    if (_database != null)
      return _database!; // Se já existir um banco, retorna-o
    _database = await _initDB(
        'demandas.db'); // Caso contrário, inicializa o banco de dados
    return _database!;
  }

  // Função para inicializar o banco de dados
  Future<Database> _initDB(String filePath) async {
    // Obtém o caminho do diretório onde o banco de dados será salvo
    final dbPath = await getDatabasesPath();
    // Cria o caminho completo combinando o diretório com o nome do arquivo do banco
    final path = join(dbPath, filePath);

    // Abre o banco de dados, criando-o se ainda não existir
    return await openDatabase(path,
        version: 1,
        onCreate:
            _createDB // Define a função que criará as tabelas na primeira execução
        );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE demandas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT,
        endereco TEXT,
        ponto_de_referencia TEXT,
        categoria TEXT,
        data TEXT
      )
    ''');
  }

  Future<void> inserirDemanda(Demanda demanda) async {
    // Obtém a instância do banco de dados
    final db = await instance.database;

    await db.insert('demandas', demanda.toJson());
  }
}
