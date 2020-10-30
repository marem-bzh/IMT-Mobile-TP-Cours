import React from 'react'
import { View, StyleSheet } from 'react-native'
import OptionMenu from './OptionMenu'

/**
 * Composant Menu.
 */
const Menu = ({ setFilter }) => (
    <View style={styles.menu}>
        <OptionMenu title="Toutes" onPress={() => setFilter("all")} />
        <OptionMenu title="Actives" onPress={() => setFilter("active")} />
        <OptionMenu title="Terminées" onPress={() => setFilter("done")} />
    </View>
)

const styles = StyleSheet.create({
    menu: {
        height: 70,
        flexDirection: 'row',
        borderTopWidth: 1,
        borderTopColor: '#dddddd'
    }
})
export default Menu