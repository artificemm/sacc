@ClientView = React.createClass
  getInitialState: ->
    client: @props.client
    phones: @props.phones

  getDefaultProps: ->

  render: ->
    React.DOM.section
      className: 'forms-basic'
      React.DOM.div
        className: 'row'
      React.createElement BasicClient, client: @state.client
      React.createElement ClientPhones, phones: @state.phones, mainPhone: @state.client.main_phone_id
