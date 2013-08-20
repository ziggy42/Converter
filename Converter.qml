// 2013

import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem
import "ui"

/*!
    \brief MainView with Tabs element.
*/

MainView {
    objectName: "mainView"
    applicationName: "Converter"
    
    headerColor: "#57365E"
    backgroundColor: "#A55263"
    footerColor: "#D75669"

    width: units.gu(50)
    height: units.gu(75)
    
    Tabs {
        id: tabs

        BaseTab {
            title: i18n.tr("Length")
            //wallpaper: "graphics/background.jpg"
        }

        BaseTab {
            title: i18n.tr("Temperature")
            //wallpaper: "graphics/background.jpg"
        }

        BaseTab {
            title: i18n.tr("Mass")
            //wallpaper: "graphics/background.jpg"
        }

        BaseTab {
            title: i18n.tr("Time")
            //wallpaper: "graphics/background.jpg"
        }
    }
}
