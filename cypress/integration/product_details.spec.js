describe("Home page", () => {
  
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  });

  it("should visit product detail page", () => {
    cy.contains("Giant Tea").click();
    cy.contains("in stock");
  });

})