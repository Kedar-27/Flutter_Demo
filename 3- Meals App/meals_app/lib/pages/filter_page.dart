import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterPage extends StatefulWidget {

  final Map<String, bool> currentFilter;
  Function saveFilter;

  FilterPage( this.currentFilter , this.saveFilter);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
 //region Properties
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  //endregion

  @override
  initState(){
    this._glutenFree = widget.currentFilter['gluten'];
    this._vegetarian = widget.currentFilter['vegetarian'];
    this._lactoseFree = widget.currentFilter['lactose'];
    this._vegan = widget.currentFilter['vegan'];

    super.initState();
  }




 Widget _buildCustomSwitchListTile(String title, String description, bool currentValue, Function updateValue){
   return SwitchListTile(
     title: Text(title),
     subtitle: Text(description),
     value: currentValue,
     onChanged: updateValue,
   );

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              final filteredData = {
                'gluten': this._glutenFree ,
                'vegan': this._vegan ,
                'lactose': this._lactoseFree ,
                "vegetarian": this._vegetarian
              };


              widget.saveFilter(filteredData);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust your meal selection.',style: Theme.of(context).textTheme.headline6,),
            ),
          Expanded(
            child: ListView(
              children: <Widget>[
                this._buildCustomSwitchListTile('Gluten-free', 'Only include gluten-free meals', this._glutenFree, (newValue) => setState((){
                  this._glutenFree = newValue;
                })),
                this._buildCustomSwitchListTile('Lactose-free', 'Only include lactose-free meals', this._lactoseFree, (newValue) => setState((){
                  this._lactoseFree = newValue;
                })),
                this._buildCustomSwitchListTile('Vegetarian', 'Only include vegetarian meals', this._vegetarian, (newValue) => setState((){
                  this._vegetarian = newValue;
                })),
                this._buildCustomSwitchListTile('Vegan', 'Only include vegan meals', this._vegan, (newValue) => setState((){
                  this._vegan = newValue;
                })),
              ],
            ),
          )



        ],
      )
    );
  }
}
class PrimitiveWrapper {
  var value;
  PrimitiveWrapper(this.value);
}

