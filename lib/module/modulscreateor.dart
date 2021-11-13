import 'package:cell_module/module/row_of_cells.dart';
import "package:collection/collection.dart";

import 'data_table.dart';
class Cell {
  Cell(this.name, {this.value});
  String name;
  dynamic value;

  Cell.manual(this.name, this.value);

  Map<String, dynamic> toMap() {
    return {name: value};
  }
}

class Module {
  Module(){dataTable = ModuleDataTable() ; }
  List<Cell>? cells;

  Map<String, dynamic> mymap = Map<String, dynamic>();

  Map<String, dynamic> celltoMap(cell) {
    int i, c;
    c = cell!.length;
    i = 0;
    do {
      mymap.addAll({cell[i].name: cell[i].value});
      i++;
    } while (i < c);
    return mymap;
  }

  late String tablename;
  Map<String, dynamic>? gettoMap() {}


  late RowofCells rowofCells;
  Module.Cells(this.cells) {
    rowofCells = RowofCells(cells!);
    dataTable = ModuleDataTable() ;
  }

  void getDataModule(List<dynamic> data, {List<Cell>? addetionaCell}) {
    datamodule.clear();
    int c = data.length;

    for (int i = 0; i < c; i++) {
      datamodule.add(data[i]);
      if (addetionaCell != null) {
        for (int e = 0; e < addetionaCell.length; e++) {
          datamodule[i].addAll(addetionaCell[e].toMap());
        }
      }
    }
  }

  Map<String, dynamic> _mymap = Map<String, dynamic>();

  List<Map<String, dynamic>> datamodule = <Map<String, dynamic>>[];
  List<RowofCells> listRowCells = [];
late  ModuleDataTable dataTable  ;
  List<RowofCells> getDataTable(List<Map<String, dynamic>> listMaps) {
  listRowCells.clear() ;
    List<RowofCells> getDatarows = [];
    for (int i = 0; i < listMaps.length; i++) {
      RowofCells rr = RowofCells.manual(listMaps[i]);
      getDatarows.add(rr);
    }
    listRowCells = getDatarows ;

    return getDatarows;
  }

  List<Map<String, dynamic>> dataTableToListMaps(List<RowofCells> listMaps) {
    List<Map<String, dynamic>> getDatarows = [];
    for (int i = 0; i < listMaps.length; i++) {
      getDatarows.add(listMaps[i].rowMap);
    }
    this.datamodule = getDatarows;
    return getDatarows;
  }

  List<Map<String, dynamic>> where(List<Map<String, dynamic>> listMaps,
      bool Function(Map<String, dynamic> el) d) {
    List<Map<String, dynamic>> getDatarows = listMaps.where(d).toList();

    return getDatarows;
  }



  List<Map<String, dynamic>> sorting(List<Map<String, dynamic>> listMaps,
      Cell cell,{bool descending =false }   ) {
      if (descending) {
        List<Map<String, dynamic>> getDatarows = listMaps.sorted((a, b) => (b[cell.name]).compareTo(a[cell.name]) );
        return getDatarows;

      }else {
        List<Map<String, dynamic>> getDatarows = listMaps.sorted((a, b) => (a[cell.name]).compareTo(b[cell.name]) );
        return getDatarows;

      }
  }


  List<dynamic> unicGrubs(List<Map<String, dynamic>> listMaps, Cell key) {
    List<dynamic>? ss = [];
    for (Map<String, dynamic> m in listMaps) {
      ss.add(m[key.name]);
    }

    print(ss);
    var distinctIds = ss.toSet().toList();
    print(distinctIds);
    return distinctIds;
  }

  void groubbyCount(List<Map<String, dynamic>> listMaps, Cell keycell) {
    List<dynamic>? keylist;

    listMaps.map((Map<String, dynamic> map) {
      keylist!.add(map[keycell.name]);
    }).toList();

    List<dynamic>? distinctIds = listMaps.toSet().toList();

    int i = 0;
  }

  Map<dynamic, List<Map<String, dynamic>>> groubBy(
      List<Map<String, dynamic>> listMaps, Cell keycell) {
    var newMap = groupBy(listMaps, (Map oj) => oj[keycell.name]);

    print(newMap);

    return newMap;
  }

  List<Map<dynamic, int>> countBy(
      List<Map<String, dynamic>> data, Cell keycell) {
    List<Map<dynamic, int>> newdata = <Map<dynamic, int>>[];

    List<dynamic> d = unicGrubs(data, keycell);
    int i = 0;
    int c = d.length;
    do {
      Map<dynamic, int> m = Map<dynamic, int>();
      int cc = data.where((e) => e[keycell.name] == d[i]).length;
      m.addAll({d[i]: cc});
      newdata.add(m);
      i++;
    } while (i < c);
    print(newdata);
    return newdata;
  }

  List<Map<dynamic, double>> sumBy(
      List<Map<String, dynamic>> data, Cell keycell, Cell sumed) {
    List<Map<dynamic, double>> newdata = <Map<dynamic, double>>[];

    List<dynamic> d = unicGrubs(data, keycell);
    int i = 0;
    int c = d.length;
    do {
      Map<dynamic, double> m = Map<dynamic, double>();
      String v = d[i];
      double sum = 0;
      for (int i = 0; i < data.length; i++) {
        if (data[i][keycell.name] == v) {
          sum += data[i][sumed.name];
        }
      }
      m.addAll({d[i]: sum});
      newdata.add(m);
      i++;
    } while (i < c);
    print(newdata);
    return newdata;
  }
}

