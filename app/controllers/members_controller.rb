class MembersController < ApplicationController

  def create
    @organization = Organization.find(params[:member][:organization_id])
    @member = Member.new(params[:member])

    respond_to do |format|
      if @member.save
        format.html { redirect_to @organization, notice: 'New member was successfully added.' }
        format.json { render json: @member, status: :created, location: @member }
      else
        format.html { redirect_to @organization, error: 'Something went wrong.' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to @member.organization }
      format.json { head :no_content }
    end
  end

end