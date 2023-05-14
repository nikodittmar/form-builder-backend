class Api::V1::FormsController < ApplicationController
    def index
        @forms = Form.all
        render json: @forms
    end

    def show
        @form = Form.find(params[:id])
        render json: @form
    end

    def create
        @form = Form.new(form_params)
        puts form_params
        if @form.save 
            render json: @form, status: :created
        else
            render json: @form.errors, status: 422
        end
    end

    def update
        @form = Form.find(params[:id])

        if @form.update(form_params)
            render json: @form
        else
            render json: @form.errors, status: :uprocessable_entity
        end
    end

    def destroy
        @form = Form.find(params[:id])
        if @form.destroy
            head :no_content
        else 
            render json: @form.errors, status: :uprocessable_entity
        end
    end

    private
    def form_params 
        params.require(:form).permit(:name, :title, :description, components: [ :type, :id, properties: {} ])
    end
end
