import 'modulscreateor.dart';

class RowofCells {
  RowofCells.nRow() {}

  List<Cell> cells = [];
  Map<String, dynamic> rowMap = {};
  RowofCells(this.cells) {
    int _ling = cells.length;
    for (int i = 0; i < _ling; i++) {
      rowMap.addAll(cells[i].toMap());
    }
  }
  void addbyCells(List<Cell> newcells) {
    cells.addAll(newcells);
    int _ling = newcells.length;
    for (int i = 0; i < _ling; i++) {
      rowMap.addAll(newcells[i].toMap());
    }
  }

  void addnewmaps(Map<String, dynamic> newwMap) {
    this.rowMap.addAll(newwMap);
  }

  RowofCells.manual(this.rowMap) {
    cells = [];
    rowMap.entries.map((e) {
      cells.add(Cell.manual(e.key, e.value));
    }).toList();
  }
  dynamic getvalue(Cell keycell) {
    return rowMap[keycell.name];
  }

  dynamic getvalueBykeyname(String keycell) {
    return rowMap[keycell];
  }
}
