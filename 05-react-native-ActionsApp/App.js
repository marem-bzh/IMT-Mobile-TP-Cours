import React from 'react'
import { StyleSheet, View, ScrollView } from 'react-native'
import Entete from './src/Entete'
import Saisie from './src/Saisie'
import BoutonCreer from './src/BoutonCreer'
import ListeActions from './src/action/ListeActions'
import Menu from './src/menu/Menu'

/**
 * Composant d'entrée de l'application.
 */
export default class App extends React.Component {

    // état global de l'application
    // il y aura probalement d'autres informations à stocker
    state = {
        texteSaisie: "",
        actions: [] /* type info: {title: string, done: boolean} */,
        filter: ""
    }

    /**
     * Méthode invoquée lorsque que la saisie change.
     *
     * @param nouvelleSaisie la valeur saisie
     */
    quandLaSaisieChange(nouvelleSaisie) {
        // console.log('la saisie à changée', nouvelleSaisie)
        this.setState({ texteSaisie: nouvelleSaisie })
    }

    /**
     * Méthode invoquée lors du clic sur le bouton `Valider`.
     */
    validerNouvelleAction() {
        // console.log('Vous avez cliqué sur Valider !')

        if (this.state.texteSaisie.trim() === "") return;

        this.setState((prevState) => { // callback form in order to access the previous state to edit it instead of replacing it
            let a = prevState.actions
            a.push({
                id: Math.random(),
                title: prevState.texteSaisie,
                done: false
            })

            return {
                actions: a,
                texteSaisie: "",
            }
        })
    }

    deleteAction = (actionId) => {
        this.setState((prevState) => { // callback form in order to access the previous state to edit it instead of replacing all of it
            let actions = prevState.actions

            actions = actions.filter(a => a.id != actionId)

            return {
                actions: actions
            }
        })
    }

    switchActionStatus = (actionId) => {
        this.setState((prevState) => { // callback form in order to access the previous state to edit it instead of replacing all of it
            const actions = prevState.actions

            const action = actions.find(a => a.id == actionId)
            if (action == null) return

            action.done = !action.done

            return {
                actions: actions
            }
        })
    }

    setFilter = (filter) => {
        this.setState({
            filter: filter
        })
    }

    getFilteredActions = () => {
        const { actions, filter } = this.state

        const ret = actions.filter(action => {
            console.log("[" + filter + "] " + action.title + " : " + action.done)
            switch (filter) {
                case "done":
                    return action.done
                case "active":
                    return !action.done
                default:
                    return true
            }
        })
        return ret
    }

    render() {
        const { texteSaisie } = this.state

        return (
            <View style={styles.conteneur}>
                <ScrollView keyboardShouldPersistTaps='always' style={styles.content}>
                    <Entete />
                    <Saisie texteSaisie={texteSaisie} evtTexteModifie={(titre) => this.quandLaSaisieChange(titre)} />
                    <ListeActions
                        actions={this.getFilteredActions()}
                        switchActionStatus={this.switchActionStatus}
                        deleteAction={this.deleteAction}
                    />
                    <BoutonCreer onValider={() => this.validerNouvelleAction()} />
                </ScrollView>
                <Menu setFilter={this.setFilter} />
            </View>
        )
    }
}

const styles = StyleSheet.create({
    conteneur: {
        flex: 1,
        backgroundColor: '#f5f5f5',
    },
    content: {
        flex: 1,
        paddingTop: 60,
    },
})