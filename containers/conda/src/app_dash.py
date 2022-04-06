import pandas as pd
from numpy.random import randn
import datetime

import plotly.express as px
from dash import Dash

try:
    from dash import dcc
    from dash import html
except ImportError:
    import dash_core_components as dcc
    import dash_html_components as html
    
from dash.dependencies import Input, Output


app = Dash(__name__)
appServer = app.server  # for gunicorn explosition

# Generate data
n = 1000
date_origin = datetime.datetime(2020, 1, 1)
timestep = datetime.timedelta(minutes=30)

x = [date_origin + k*timestep for k in range(n)]
y = randn(n)

df = pd.DataFrame(data={'ts': x, 'Consommation': y})


app.layout = html.Div(children=[
    html.Label('Slider'),
    dcc.Slider(
        id='my-slider',
        min=0,
        max=9,
        marks={i: 'Label {}'.format(i) if i == 1 else str(i) for i in range(1, 10)},
        value=5,
    ),

    dcc.Graph(id='graph1'),

])

@app.callback(
    Output('graph1', 'figure'),
    Input('my-slider', 'value'))
def update_figure(selected_value):
    filtered_df = df.loc[0:selected_value * int(len(df)/9)]

    fig = px.scatter(data_frame=filtered_df, x='ts', y='Consommation')
    fig.update_layout(transition_duration=500)

    return fig

if __name__ == '__main__':
    app.run_server(host='127.0.0.1', port='5000', debug=True)

