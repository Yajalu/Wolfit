import { Application } from "express";
import { list } from './controllers/ejercicios_controller';

export function routes(app: Application){
    app.get('/api/ejercicio', list);
}