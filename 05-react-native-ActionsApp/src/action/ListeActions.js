import React from 'react'
import { View, Text } from 'react-native'
import UneAction from './UneAction'


const ListeActions = ({ actions, switchActionStatus, deleteAction }) => {

    return (
        <View>
            {
                actions.map(action =>
                    <UneAction
                        key={"key-" + action.id} /* giving a unique key prop to each child of the list */
                        action={action}
                        switchActionStatus={() => { switchActionStatus(action.id) }}
                        deleteAction={() => { deleteAction(action.id) }}
                    />
                )
            }
        </View>
    )
}

export default ListeActions

