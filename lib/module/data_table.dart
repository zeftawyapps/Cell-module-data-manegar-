
import 'package:cell_module/module/row_of_cells.dart';

import 'modulscreateor.dart';

class ModuleDataTable {
  List<RowofCells> dataTable = [];

  List<RowofCells> getDataTable(List<Map<String, dynamic>> listMaps,
      {List<Cell>? AddCells}) {
    dataTable.clear();
    RowofCells? newcells;
    List<RowofCells> getDatarows = [];

    for (int i = 0; i < listMaps.length; i++) {
      RowofCells rr = RowofCells.manual(listMaps[i]);

      if (AddCells != null) {
        newcells = RowofCells(AddCells);
        rr.addbyCells(newcells.cells);
      }
      getDatarows.add(rr);
    }
    dataTable = getDatarows;
    this.listmap = listMaps;
    return getDatarows;
  }

  List<Map<String, dynamic>> listmap = <Map<String, dynamic>>[];

  List<Map<String, dynamic>> dataTableToListMaps(List<RowofCells> listMaps) {
    List<Map<String, dynamic>> getDatarows = [];
    for (int i = 0; i < listMaps.length; i++) {
      getDatarows.add(listMaps[i].rowMap);
    }
    this.listmap = getDatarows;
    return getDatarows;
  }

  void addRow(RowofCells rowofCells) {
    this.dataTable.add(rowofCells);
    listmap = dataTableToListMaps(this.dataTable);
  }
}
