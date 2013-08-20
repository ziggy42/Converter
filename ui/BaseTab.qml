import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem
import "../JS/logic.js" as Logic

Tab {
    id: mainTab

    property alias wallpaper: background.source;

    Component.onCompleted: {
        boxesBase.append({"number":1,"quant": 0, "unit": Logic.selectArrayOfValues(mainTab.title)[0]});
        boxesBase.append({"number":2,"quant": 0, "unit": Logic.selectArrayOfValues(mainTab.title)[0]});
    }

    page: Page{
        Image{ id: background; width: parent.width; height: parent.height; }
        Component{
            id: baseDelegate
            Column{
                id: baseColumn
                width: parent.width * 2/3
                anchors.horizontalCenter: parent.horizontalCenter

                ListItem.ValueSelector {
                    id: valueSelector
                    values: Logic.selectArrayOfValues(mainTab.title)

                    TextField {
                        id: textInput1
                        width: parent.width*3/4
                        text: quant

                        onTextChanged: {
                            if(text === "") boxesBase.setProperty(number-1,"quant",0);
                            else boxesBase.setProperty(number-1,"quant",parseFloat(text));
                            boxesBase.setProperty(number-1,"unit",Logic.selectArrayOfValues(mainTab.title)[valueSelector.selectedIndex]);

                            mainTab.bind(quant,unit);
                        }
                    }

                    onSelectedIndexChanged: {
                        boxesBase.setProperty(number-1,"unit",Logic.selectArrayOfValues(mainTab.title)[valueSelector.selectedIndex]);
                        mainTab.bind(quant,unit);
                    }
                }
            }
        }
        ListView{id: boxesBaseView; anchors.fill: parent; anchors.topMargin:  20 ;spacing: units.gu(2); model: boxesBase; delegate: baseDelegate}
        ListModel{id: boxesBase; }
        tools: ToolbarItems {
            ToolbarButton {
                action: Action {
                    iconSource: "../graphics/erase.svg"
                    text: i18n.tr("OneLess")
                    onTriggered: {
                        if(boxesBase.count !== 0){
                            boxesBase.remove(boxesBase.count-1)
                        }
                    }
                }
            }

            ToolbarButton {
                action: Action {
                    iconSource: "../graphics/add.svg"
                    text: i18n.tr("OneMore")
                    onTriggered: {
                        if(boxesBase.count !== 0){
                            boxesBase.append({"number":boxesBase.count+1,"quant":Logic.converter(boxesBase.get(0).quant,boxesBase.get(0).unit,Logic.selectArrayOfValues(mainTab.title)[0])});
                        }else{
                            boxesBase.append({"number":1,"quant": 0, "unit": Logic.selectArrayOfValues(mainTab.title)[0]});
                        }
                    }
                }
            }

            back: ToolbarButton {
                    text: i18n.tr("Clear")
                    iconSource: "../graphics/reload.svg"
                    visible: true
                    onTriggered: {
                        boxesBase.clear()
                        boxesBase.append({"number":boxesBase.count+1,"quant": 0, "unit": Logic.selectArrayOfValues(mainTab.title)[0]});
                        boxesBase.append({"number":boxesBase.count+1,"quant": 0, "unit": Logic.selectArrayOfValues(mainTab.title)[0]});
                    }
            }
        }

    }
    function bind(value,unit){
        for(var i = 0; i < boxesBase.count; i++)
            boxesBase.setProperty(i,"quant",Logic.converter(value,unit,boxesBase.get(i).unit));
    }
}
