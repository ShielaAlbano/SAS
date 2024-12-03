# Calculate tire lifespan
data["production_date"] = pd.to_datetime(data["production_date"])
data["failure_date"] = pd.to_datetime(data["failure_date"])
data["lifespan_months"] = (data["failure_date"] - data["production_date"]).dt.days / 30

# Plot the histogram
plt.figure(figsize=(10, 6))
plt.hist(data["lifespan_months"].dropna(), bins=20, color="blue", alpha=0.7)
plt.title("Tire Lifespan Distribution")
plt.xlabel("Lifespan (Months)")
plt.ylabel("Frequency")
plt.tight_layout()
plt.show()

# Importance:
# - Visualizes durability trends to improve product design.
